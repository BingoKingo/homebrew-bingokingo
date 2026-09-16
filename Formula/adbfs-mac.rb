class AdbfsMac < Formula
  desc "Mount Android phones with adb rootlessly (require adb, macfuse)"
  homepage "https://github.com/chen3feng/adbfs/"
  license "BSD-3-Clause"
  head "https://github.com/chen3feng/adbfs.git", branch: "master"

  depends_on "pkg-config" => :build
  depends_on :macos

  patch :DATA # try su if available; checksum via device-side

  def install
    # macFUSE puts pkg-config into /usr/local/lib/pkgconfig, which is not included in
    # homebrew's default PKG_CONFIG_PATH. We need to tell pkg-config about this path for our build
    ENV.prepend_path "LIBRARY_PATH", "/usr/local/lib"
    ENV.prepend_path "PKG_CONFIG_PATH", "/usr/local/lib/pkgconfig"
    ENV["DYLD_LIBRARY_PATH"] = "/usr/local/lib"
    system "make", "prefix=#{prefix}", "FUSE_PKG=fuse-t"
    bin.install "adbfs"
  end

  def post_install
    File.write opt_prefix/"homebrew.adbfs-mac.sh", <<~EOS
      #!/bin/bash
      /bin/mkdir -p /tmp/fuse/adb; #{opt_bin}/adbfs /tmp/fuse/adb -d
    EOS
    system "/bin/chmod", "555", opt_prefix/"homebrew.adbfs-mac.sh"
  end

  service do
    run [opt_prefix/"homebrew.adbfs-mac.sh"]
    keep_alive true
  end

  def caveats
    <<~EOS
      `adb` should be installed first,
      try `brew install android-platform-tools`
      or `brew install android-studio` and export PATH.
    EOS
  end

  test do
    system bin/"adbfs", "-V"
  end
end
__END__
diff --git a/adbfs.cpp b/adbfs.cpp
index 179d49a..2755b7f 100644
--- a/adbfs.cpp
+++ b/adbfs.cpp
@@ -82,7 +82,7 @@
 #include <sys/types.h>
 #include <pwd.h>
 #include <grp.h>
-#include <pthread.h>
+
 
 void handler(int sig) {
   void *array[10];
@@ -156,25 +156,7 @@ bool touch_gnu_mode = true;
 // seeking in a video). Once a handle has been read past the threshold below we
 // fall back to a single full pull so sequential/full reads (e.g. `cp`) don't
 // pay per-chunk adb overhead.
-struct ReadHandle {
-    string remote;     // shell-escaped device path
-    string local;      // shell-escaped local temp path (for the pull fallback)
-    string local_raw;  // local temp path, unescaped (for open())
-    off_t served;      // bytes served via ranged reads so far
-    int local_fd;      // >= 0 once we have fallen back to a full pull
-    bool pulling;      // a full pull is currently in progress
-    pthread_mutex_t mtx; // guards the read-ahead buffer below
-    off_t buf_off;     // device offset of buffered bytes, -1 when empty
-    vector<char> buf;  // read-ahead buffer
-};
-map<uint64_t, ReadHandle*> readHandles;
-// FUSE issues read-ahead reads concurrently; this guards the handle table and
-// the pull-fallback decision so the whole file is pulled at most once.
-static pthread_mutex_t readHandleMutex = PTHREAD_MUTEX_INITIALIZER;
-static const off_t RANGED_READ_PULL_THRESHOLD = 4 * 1024 * 1024;
-// One ranged fetch grabs this much, so a run of small sequential reads (e.g.
-// `cp`, media playback) costs one adb round-trip instead of dozens.
-static const size_t RANGED_READ_AHEAD = 1024 * 1024;
+
 
 /**
    Custom options
@@ -217,12 +199,33 @@ queue<string> shell(const string& command)
    @see exec_command.
    @todo perhaps avoid use of local shell to simplify escaping.
  */
+static bool su_available = false;
+static bool su_checked = false;
+
+bool check_su_available() {
+    if (su_checked) return su_available;
+    queue<string> result = exec_command("adb shell su -c 'whoami' 2>&1");
+    su_checked = true;
+    if (!result.empty()) {
+        string output = result.front();
+        if (output.find("root") != string::npos) {
+            su_available = true;
+        }
+    }
+    return su_available;
+}
+
 queue<string> adb_shell(const string& command, bool getStderr = false)
 {
     string actual_command;
     actual_command.assign(command);
     //adb_shell_escape_command(actual_command);
-    actual_command.insert(0, "adb shell \"");
+    
+    if (check_su_available()) {
+        actual_command.insert(0, "adb shell su -c \"");
+    } else {
+        actual_command.insert(0, "adb shell \"");
+    }
     actual_command.append("\"");
     if (getStderr) actual_command.append(" 2>&1");
     return exec_command(actual_command);
@@ -476,34 +479,42 @@ static int adb_getattr(const char *path, struct stat *stbuf)
     string path_string;
     path_string.assign(path);
     shell_escape_path(path_string);
-    // TODO /caching?
-    //
+
     vector<string> output_chunk;
-    if (fileData.find(path_string) ==  fileData.end()
-	|| fileData[path_string].timestamp + 30 < time(NULL)) {
-        string command = "ls -l -a -d '";
-        command.append(path_string);
-        command.append("'");
-        output = adb_shell(command, true);
-        if (output.empty()) return -EAGAIN; /* no phone */
-        // error format: "/sbin/healthd: Permission denied"
+    bool use_cache = false;
+    
+    string command = "ls -l -a -d '";
+    command.append(path_string);
+    command.append("'");
+    output = adb_shell(command, true);
+    
+    if (output.empty()) {
+        use_cache = true;
+    } else {
         if (
             output.front().length() > sizeof(PERMISSION_ERR_MSG) &&
             (!output.front().compare(output.front().length() - sizeof(PERMISSION_ERR_MSG) + 1,
                                     sizeof(PERMISSION_ERR_MSG) - 1, PERMISSION_ERR_MSG)))
         {
-            fileData[path_string].statOutput.erase();
+            use_cache = true;
         } else {
             output_chunk = make_array(output.front());
             fileData[path_string].statOutput = output.front();
+            fileData[path_string].timestamp = time(NULL);
         }
-        fileData[path_string].timestamp = time(NULL);
-    } else{
-        output_chunk = make_array(fileData[path_string].statOutput);
-        cout << "from cache " << path << "\n";
     }
+    
+    if (use_cache) {
+        if (fileData.find(path_string) != fileData.end() && !fileData[path_string].statOutput.empty()) {
+            cout << "adb_getattr: using cache for " << path << endl;
+            output_chunk = make_array(fileData[path_string].statOutput);
+        } else {
+            stbuf->st_mode = S_IFREG;
+            return res;
+        }
+    }
+
     if (fileData[path_string].statOutput.empty()) {
-        // return empty structure - file exists, but no info available
         stbuf->st_mode = S_IFREG;
         return res;
     }
@@ -525,7 +536,7 @@ static int adb_getattr(const char *path, struct stat *stbuf)
     // xxx is regular mode e.g. 755 = rwxr-xr-x
     //
 
-    stbuf->st_ino = 1;      /* inode number, fake. */
+    stbuf->st_ino = hash<string>{}(path_string);      /* unique inode based on path hash */
 
     stbuf->st_mode = strmode_to_rawmode(output_chunk[0]); // | 0700
 
@@ -582,7 +593,7 @@ static int adb_getattr(const char *path, struct stat *stbuf)
 
     // du calculates sizes based on number of 512b blocks
     stbuf->st_blksize = 512;
-    stbuf->st_blocks = (stbuf->st_size + 256) / 512;
+    stbuf->st_blocks = (stbuf->st_size + 511) / 512;
 
     //for (int k = 0; k < output_chunk.size(); ++k) cout << output_chunk[k] << " ";
     //cout << endl;
@@ -597,14 +608,14 @@ static int adb_getattr(const char *path, struct stat *stbuf)
     //cout << endl;
     // Guard against malformed/exotic date output to avoid out-of-range
     // vector access crashing the whole filesystem.
-    if (ymd.size() == 3 && hm.size() == 2) {
+    if (ymd.size() == 3 && hm.size() >= 2) {
         struct tm ftime{};
         ftime.tm_year = atoi(ymd[0].c_str()) - 1900;
         ftime.tm_mon  = atoi(ymd[1].c_str()) - 1;
         ftime.tm_mday = atoi(ymd[2].c_str());
         ftime.tm_hour = atoi(hm[0].c_str());
         ftime.tm_min  = atoi(hm[1].c_str());
-        ftime.tm_sec  = 0;
+        ftime.tm_sec  = (hm.size() >= 3) ? atoi(hm[2].c_str()) : 0;
         ftime.tm_isdst = -1;
         time_t now = mktime(&ftime);
         //cout << "after mktime" << endl;
@@ -644,29 +655,36 @@ static int adb_readdir(const char *path, void *buf, fuse_fill_dir_t filler,
     path_string.assign(path);
     shell_escape_path(path_string);
 
-    // Fetch the directory listing once and cache it. The kernel paginates a
-    // large directory by calling readdir repeatedly with growing offsets
-    // (especially the NFS-backed fuse-t on macOS); serving those calls from
-    // the cache avoids re-running `ls` on the device every time.
-    map<string, dirCache>::iterator dit = dirData.find(path_string);
-    if (dit == dirData.end() || dit->second.timestamp + 30 < time(NULL)) {
-        string command = "ls -l -a '";
-        command.append(path_string);
-        command.append("'");
-        queue<string> output = adb_shell(command);
-        dirCache& entry = dirData[path_string];
-        entry.lines.clear();
+    vector<string> lines;
+    bool use_cache = false;
+
+    string command = "ls -l -a '";
+    command.append(path_string);
+    command.append("'");
+    queue<string> output = adb_shell(command);
+    
+    if (output.empty()) {
+        use_cache = true;
+    } else {
         while (!output.empty()) {
-            entry.lines.push_back(output.front());
+            lines.push_back(output.front());
             output.pop();
         }
+        dirCache& entry = dirData[path_string];
+        entry.lines = lines;
         entry.timestamp = time(NULL);
-        dit = dirData.find(path_string);
-        cout << "found files: " << entry.lines.size() << endl;
-    } else {
-        cout << "found files (cached): " << dit->second.lines.size() << endl;
+        cout << "found files: " << lines.size() << endl;
+    }
+    
+    if (use_cache) {
+        map<string, dirCache>::iterator dit = dirData.find(path_string);
+        if (dit != dirData.end()) {
+            cout << "adb_readdir: using cache for " << path << endl;
+            lines = dit->second.lines;
+        } else {
+            return 0;
+        }
     }
-    const vector<string>& lines = dit->second.lines;
 
     /* cannot tell between "no phone" and "empty directory" */
     for (size_t i = offset; i < lines.size(); ++i) {
@@ -749,27 +767,6 @@ static int adb_create(const char *path, mode_t mode, struct fuse_file_info *fi)
     return 0;
 }
 
-// Fetch [offset, offset+size) of a device file directly into buf using a
-// binary-safe `adb exec-out` + toybox dd ranged read. Returns the number of
-// bytes read (may be short at EOF), or -EIO on failure.
-static int adb_read_range(const string& remote_escaped, off_t offset,
-                          size_t size, char *buf) {
-    ostringstream cmd;
-    cmd << "adb exec-out \"toybox dd if='" << remote_escaped
-        << "' iflag=skip_bytes,count_bytes bs=1048576 skip=" << offset
-        << " count=" << size << " 2>/dev/null\"";
-    FILE *fp = popen(cmd.str().c_str(), "r");
-    if (!fp) return -EIO;
-    size_t total = 0;
-    while (total < size) {
-        size_t n = fread(buf + total, 1, size - total, fp);
-        if (n == 0) break;
-        total += n;
-    }
-    pclose(fp);
-    return (int)total;
-}
-
 static int adb_open(const char *path, struct fuse_file_info *fi)
 {
     string path_string;
@@ -787,134 +784,37 @@ static int adb_open(const char *path, struct fuse_file_info *fi)
 
     cout << "-- adb_open --" << path_string << " " << local_path_string << "\n";
 
-    // Read-only opens: don't pull the whole file. Confirm it exists, then serve
-    // reads on demand (ranged reads), falling back to a full pull only once the
-    // file is read substantially (see adb_read).
-    if ((fi->flags & O_ACCMODE) == O_RDONLY && !fileTruncated[path_string]) {
-        // getattr runs just before open and caches the file's stat; reuse it so
-        // repeated opens (macOS copyfile opens a file many times) don't each pay
-        // an `ls` round-trip. Only hit the device on a cache miss.
-        map<string, fileCache>::iterator ci = fileData.find(path_string);
-        bool cached_ok = ci != fileData.end() && ci->second.timestamp + 30 >= time(NULL)
-                         && !ci->second.statOutput.empty()
-                         && is_valid_ls_output(ci->second.statOutput);
-        if (!cached_ok) {
-            string command = "ls -l -a -d '";
-            command.append(path_string);
-            command.append("'");
-            queue<string> output = adb_shell(command);
-            if (output.empty()) return -ENOENT;
-            vector<string> output_chunk = make_array(output.front());
-            if (output_chunk.empty() || !is_valid_ls_output(output_chunk[0]))
-                return -ENOENT;
-        }
-        ReadHandle *h = new ReadHandle();
-        h->remote = path_string;
-        h->local = local_path_string;
-        h->local_raw = filehandle_path;
-        h->served = 0;
-        h->local_fd = -1;
-        h->pulling = false;
-        pthread_mutex_init(&h->mtx, NULL);
-        h->buf_off = -1;
-        pthread_mutex_lock(&readHandleMutex);
-        fi->fh = (uint64_t)(uintptr_t)h;
-        readHandles[fi->fh] = h;
-        pthread_mutex_unlock(&readHandleMutex);
-        return 0;
-    }
-
-    if (!fileTruncated[path_string]){
-        queue<string> output;
+    // Always pull the whole file for consistency - this ensures checksums match
+    // between different read operations and adb_pull
+    if (!fileTruncated[path_string]) {
         string command = "ls -l -a -d '";
         command.append(path_string);
         command.append("'");
-        cout << command<<"\n";
-        output = adb_shell(command);
+        queue<string> output = adb_shell(command);
         vector<string> output_chunk = make_array(output.front());
         if (!is_valid_ls_output(output_chunk[0])) {
-          return -ENOENT;
+            return -ENOENT;
         }
-        path_string.assign(path);
-        local_path_string = tempDirPath;
-        string_replacer(path_string,"/","-");
-        local_path_string.append(path_string);
-        path_string.assign(path);
-        shell_escape_path(path_string);
-        shell_escape_path(local_path_string);
-        adb_pull(path_string,local_path_string);
+        fileData[path_string].statOutput = output.front();
+        fileData[path_string].timestamp = time(NULL);
+        
+        adb_pull(path_string, local_path_string);
     } else {
         fileTruncated[path_string] = false;
     }
 
     fi->fh = open(filehandle_path.c_str(), fi->flags);
-
     return 0;
 }
 
 static int adb_read(const char *path, char *buf, size_t size, off_t offset,
     struct fuse_file_info *fi)
 {
-    pthread_mutex_lock(&readHandleMutex);
-    map<uint64_t, ReadHandle*>::iterator it = readHandles.find(fi->fh);
-    ReadHandle *h = (it != readHandles.end()) ? it->second : NULL;
-    bool do_pull = false;
-    if (h && h->local_fd < 0 && !h->pulling) {
-        // Once a read-only handle has been read substantially, pull the whole
-        // file once and serve the rest locally. Only one thread does this.
-        h->served += size;
-        if (h->served > RANGED_READ_PULL_THRESHOLD)
-            do_pull = h->pulling = true;
-    }
-    pthread_mutex_unlock(&readHandleMutex);
-
-    if (h) {
-        if (do_pull) {
-            adb_pull(h->remote, h->local);
-            int lfd = open(h->local_raw.c_str(), O_RDONLY);
-            pthread_mutex_lock(&readHandleMutex);
-            h->local_fd = lfd;
-            h->pulling = false;
-            pthread_mutex_unlock(&readHandleMutex);
-        }
-        if (h->local_fd >= 0) {
-            int res = pread(h->local_fd, buf, size, offset);
-            return res == -1 ? -errno : res;
-        }
-        // Ranged read served through a per-handle read-ahead buffer.
-        pthread_mutex_lock(&h->mtx);
-        bool covered = h->buf_off >= 0 && offset >= h->buf_off &&
-                       (off_t)(offset + size) <= h->buf_off + (off_t)h->buf.size();
-        if (!covered) {
-            size_t fetch = size > RANGED_READ_AHEAD ? size : RANGED_READ_AHEAD;
-            h->buf.resize(fetch);
-            int got = adb_read_range(h->remote, offset, fetch, &h->buf[0]);
-            if (got < 0) {
-                pthread_mutex_unlock(&h->mtx);
-                return got;
-            }
-            h->buf.resize(got);
-            h->buf_off = offset;
-        }
-        size_t start = offset - h->buf_off;
-        size_t avail = h->buf.size() - start;
-        size_t n = size < avail ? size : avail;
-        if (n) memcpy(buf, &h->buf[start], n);
-        pthread_mutex_unlock(&h->mtx);
-        return (int)n;
-    }
-
-    int fd;
-    int res;
-    fd = fi->fh; //open(local_path_string.c_str(), O_RDWR);
-    if(fd == -1)
+    int fd = fi->fh;
+    if (fd == -1)
         return -errno;
-    res = pread(fd, buf, size, offset);
-    //close(fd);
-    if(res == -1)
-        res = -errno;
-
-    return res;
+    int res = pread(fd, buf, size, offset);
+    return res == -1 ? -errno : res;
 }
 
 static int adb_write(const char *path, const char *buf, size_t size, off_t offset, struct fuse_file_info *fi) {
@@ -938,12 +838,6 @@ static int adb_write(const char *path, const char *buf, size_t size, off_t offse
 
 
 static int adb_flush(const char *path, struct fuse_file_info *fi) {
-    // Read-only ranged handles have nothing to flush back to the device.
-    pthread_mutex_lock(&readHandleMutex);
-    bool ranged = readHandles.count(fi->fh) > 0;
-    pthread_mutex_unlock(&readHandleMutex);
-    if (ranged)
-        return 0;
     string path_string;
     string local_path_string;
     path_string.assign(path);
@@ -955,9 +849,7 @@ static int adb_flush(const char *path, struct fuse_file_info *fi) {
     shell_escape_path(path_string);
     shell_escape_path(local_path_string);
 
-    int flags = fi->flags;
     int fd = fi->fh;
-    cout << "flag is: "<< flags <<"\n";
     invalidateCache(path_string);
     if (filePendingWrite[fd]) {
         filePendingWrite[fd] = false;
@@ -969,39 +861,17 @@ static int adb_flush(const char *path, struct fuse_file_info *fi) {
 }
 
 static int adb_release(const char *path, struct fuse_file_info *fi) {
-    // Read-only ranged handle: close/clean up the pull-fallback copy (if any)
-    // and free the handle.
-    pthread_mutex_lock(&readHandleMutex);
-    map<uint64_t, ReadHandle*>::iterator it = readHandles.find(fi->fh);
-    ReadHandle *h = (it != readHandles.end()) ? it->second : NULL;
-    if (h)
-        readHandles.erase(it);
-    pthread_mutex_unlock(&readHandleMutex);
-    if (h) {
-        if (h->local_fd >= 0) {
-            close(h->local_fd);
-            unlink(h->local_raw.c_str());
-        }
-        pthread_mutex_destroy(&h->mtx);
-        delete h;
-        return 0;
-    }
-
-    // just like in the other functions
     string path_string;
     string local_path_string;
     path_string.assign(path);
     local_path_string = tempDirPath;
     string_replacer(path_string,"/","-");
     local_path_string.append(path_string);
-    path_string.assign(path);
 
-    // untouched
     int fd = fi->fh;
     filePendingWrite.erase(filePendingWrite.find(fd));
     close(fd);
     
-    // remove local copy
     unlink(local_path_string.c_str());    
     return 0;
 }
@@ -1259,6 +1129,7 @@ static int adb_readlink(const char *path, char *buf, size_t size)
     shell_escape_path(path_string);
 
     queue<string> output;
+    bool use_cache = false;
 
     // get the number of slashes in the path
     size_t num_slashes, ii;
@@ -1267,28 +1138,32 @@ static int adb_readlink(const char *path, char *buf, size_t size)
             num_slashes++;
     if (num_slashes >= 1) num_slashes--;
 
-    if (fileData.find(path_string) ==  fileData.end()
-	|| fileData[path_string].timestamp + 30 < time(NULL)) {
-        string command = "ls -l -a -d '";
-        command.append(path_string);
-        command.append("'");
-        output = adb_shell(command);
-        if (output.empty())
-            return -EINVAL;
-        // error format: "/sbin/healthd: Permission denied"
-
+    string command = "ls -l -a -d '";
+    command.append(path_string);
+    command.append("'");
+    output = adb_shell(command);
+    
+    if (output.empty()) {
+        use_cache = true;
+    } else {
         if ((output.front().length() > sizeof(PERMISSION_ERR_MSG)) &&
            (!output.front().compare(output.front().length() - sizeof(PERMISSION_ERR_MSG) + 1,
                                     sizeof(PERMISSION_ERR_MSG) - 1, PERMISSION_ERR_MSG)))
         {
-            fileData[path_string].statOutput.erase();
+            use_cache = true;
         } else {
             fileData[path_string].statOutput = output.front();
+            fileData[path_string].timestamp = time(NULL);
         }
-        fileData[path_string].timestamp = time(NULL);
-    } else{
-        cout << "from cache " << path << "\n";
     }
+    
+    if (use_cache) {
+        if (fileData.find(path_string) == fileData.end() || fileData[path_string].statOutput.empty()) {
+            return -EINVAL;
+        }
+        cout << "adb_readlink: using cache for " << path << "\n";
+    }
+    
     string &res = fileData[path_string].statOutput;
     if (res.empty()) {
         // file exists, but no info available
@@ -1447,4 +1322,4 @@ int main(int argc, char *argv[])
     fuse_opt_parse(&args, &adbfs_conf, adb_opts, NULL);
 
     return fuse_main(args.argc, args.argv, &adbfs_oper, NULL);
-}
+}
\ No newline at end of file
