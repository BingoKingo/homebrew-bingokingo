class Magiskboot < Formula
  desc "Android magisk boot image modification tool (native macOS/Linux build)"
  homepage "https://topjohnwu.github.io/Magisk/tools.html"
  url "https://github.com/topjohnwu/Magisk/archive/refs/tags/v30.7.tar.gz"
  sha256 "9a908fc13a60bbb95c848c9e8cfbb5bd4e49fda98ee6932907c4a517fbc95437"
  license "GPL-3.0-or-later"
  head "https://github.com/topjohnwu/Magisk.git", branch: "master"

  # Upstream only ships an Android (NDK) build. This formula patches the
  # source so magiskboot can be compiled as a *native* binary for the host
  # (macOS / Linux) using the system C++ compiler + stable Rust (the crate
  # requires edition 2024, stable as of Rust 1.85).
  # The workspace `[patch.crates-io]` redirects `quick-protobuf` / `pb-rs` to a
  # git source (topjohnwu/quick-protobuf), so cargo needs the git CLI to fetch
  # them. We force the CLI fetcher via CARGO_NET_GIT_FETCH_WITH_CLI below.
  depends_on "git" => :build
  depends_on "rust" => :build
  depends_on "lz4"

  resource "cxx-rs" do
    url "https://github.com/topjohnwu/cxx/archive/b09b91554b392523f633b9e3cbe0b43273528c71.tar.gz"
    sha256 "092b7d1c523841a00a8ef6ab65a1aefed3945e4f1b6feaecc9c2241d2e7025c6"
  end

  def install
    src = buildpath.glob("**/native/src").first
    raise "could not locate native/src in extracted source" if src.nil?

    cargo_config = src/".cargo/config.toml"
    cargo_config.delete if cargo_config.exist?
    cargo_config.write <<~TOML
      # Overridden for the host (non-Android) build by the Homebrew formula.
    TOML

    patchfile = File.expand_path("../Patches/magiskboot/magiskboot-30.7.diff", __dir__)
    cd src do
      system "patch", "-p1", "-i", patchfile
    end

    cargo_toml = (src/"Cargo.toml").read
    cargo_toml.gsub!('panic = "immediate-abort"', 'panic = "abort"')
    File.write(src/"Cargo.toml", cargo_toml)
    cxx_rs_dir = src/"external/cxx-rs"
    cxx_rs_dir.mkpath
    resource("cxx-rs").stage { cp_r ".", cxx_rs_dir }
    shims = buildpath/"shims"
    (shims/"android").mkpath
    (shims/"android/log.h").write <<~C
      #pragma once
      #include <stdio.h>
      #include <stdarg.h>
      #ifdef __cplusplus
      extern "C" {
      #endif
      typedef enum android_LogPriority {
          ANDROID_LOG_UNKNOWN = 0, ANDROID_LOG_DEFAULT, ANDROID_LOG_VERBOSE,
          ANDROID_LOG_DEBUG, ANDROID_LOG_INFO, ANDROID_LOG_WARN,
          ANDROID_LOG_ERROR, ANDROID_LOG_FATAL, ANDROID_LOG_SILENT,
      } android_LogPriority;
      static inline int __android_log_print(int p, const char *t, const char *f, ...) {
          (void)p; (void)t; va_list a; va_start(a, f); int r = vprintf(f, a); va_end(a); return r;
      }
      static inline int __android_log_vprint(int p, const char *t, const char *f, va_list a) {
          (void)p; (void)t; return vprintf(f, a);
      }
      #ifdef __cplusplus
      }
      #endif
    C

    if OS.mac?
      (shims/"macos/sys").mkpath
      (shims/"macos/linux").mkpath
      (shims/"macos/sys/prctl.h").write "#pragma once\n"
      (shims/"macos/syscall.h").write "#pragma once\n#include <sys/syscall.h>\n"
      (shims/"macos/linux/fs.h").write <<~C
        #pragma once
        #define BLKGETSIZE64 0x80081272
        #define BLKBSZGET    0x80081270
        #define BLKSSZGET    0x00001268
      C
      (shims/"macos/portability.h").write <<~C
        #pragma once
        #include <string.h>
        #include <unistd.h>
        #include <fcntl.h>
        #include <signal.h>
        static inline void *magiskboot_memmem(const void *h, size_t hl, const void *n, size_t nl) {
            if (nl == 0) return (void *)h;
            const char *hp = (const char *)h, *np = (const char *)n;
            for (size_t i = 0; i + nl <= hl; i++)
                if (!memcmp(hp + i, np, nl)) return (void *)(hp + i);
            return NULL;
        }
        #define memmem magiskboot_memmem
        static inline off_t magiskboot_lseek64(int fd, off_t o, int w) { return lseek(fd, o, w); }
        #define lseek64 magiskboot_lseek64
        static inline int magiskboot_ftruncate64(int fd, off_t l) { return ftruncate(fd, l); }
        #define ftruncate64 magiskboot_ftruncate64
        static inline long magiskboot_syscall(long n, ...) { (void)n; return -1; }
        #define syscall magiskboot_syscall
        #define __NR_pidfd_open 0
        static inline int magiskboot_prctl(int o, ...) { (void)o; return 0; }
        #define prctl magiskboot_prctl
         #define PR_SET_PDEATHSIG 0
         #define PR_SET_NAME 0
         #ifndef O_CLOEXEC
         #define O_CLOEXEC 0x1000000
         #endif
      C
    end

    gen = src.parent/"out/generated"
    gen.mkpath
    ver_parts = version.to_s.split(".").map(&:to_i)
    ver_code = (ver_parts[0] * 1000) + (ver_parts[1] * 100)
    (gen/"flags.h").write <<~C
      #pragma once
      #define MAGISK_VERSION      "#{version}"
      #define MAGISK_VER_CODE     #{ver_code}
      #define MAGISK_DEBUG        0
    C

    (buildpath/"main.cpp").write <<~C
      extern "C" int magiskboot_main(int argc, const char *const *argv,
                                    const char *const *envp);
      int main(int argc, char **argv, char **envp) {
          return magiskboot_main(argc, (const char *const *)argv,
                                 (const char *const *)envp);
      }
    C

    ENV.delete("HOMEBREW_RUSTFLAGS")
    ENV.delete("RUSTFLAGS")
    ENV.delete("CARGO_BUILD_RUSTFLAGS")
    ENV.delete("RUSTC_WRAPPER")
    # Git-based crate replacements (patch.crates-io -> topjohnwu/quick-protobuf)
    # need the CLI git fetcher on some cargo versions.
    ENV["CARGO_NET_GIT_FETCH_WITH_CLI"] = "true"

    cd src do
      system "cargo", "build", "-p", "magiskboot", "--lib", "--release", "--verbose"
    end
    rust_lib = Dir["#{src}/target/release/libmagiskboot.a"].first
    raise "libmagiskboot.a not found" if rust_lib.nil?

    cxx_h = src/"external/cxx-rs/include/cxx.h"
    raise "cxx.h not found" unless cxx_h.exist?

    cxx_inc = buildpath/"cxxinc"
    (cxx_inc/"rust").mkpath
    cp cxx_h.to_s, (cxx_inc/"rust/cxx.h").to_s

    inc = [
      "-I#{src}/include",
      "-I#{src}/base/include",
      "-I#{src}/base",
      "-I#{src}/boot",
      "-I#{gen}",
      "-I#{shims}",
      "-I#{cxx_inc}",
    ]
    inc << "-I#{shims}/macos" if OS.mac?

    cxxflags = ["-std=c++20", "-O2", *inc]
    cxxflags += ["-include", "#{shims}/macos/portability.h"] if OS.mac?

    cxx = "c++"
    objs = []

    cxx_sources = ["#{src}/boot/bootimg.cpp", "#{src}/base/base.cpp"] +
                  Dir["#{src}/**/*-rs.cpp"]
    cxx_sources.each do |f|
      obj = "#{buildpath}/#{File.basename(f, ".cpp")}.o"
      system cxx, *cxxflags, "-c", f, "-o", obj
      objs << obj
    end

    cxx_runtime_src = src/"external/cxx-rs/src/cxx.cc"
    cxx_runtime_obj = "#{buildpath}/cxxbridge1.o"
    system cxx, *cxxflags, "-c", cxx_runtime_src, "-o", cxx_runtime_obj
    objs << cxx_runtime_obj

    main_obj = "#{buildpath}/main.o"
    system cxx, *cxxflags, "-c", "#{buildpath}/main.cpp", "-o", main_obj
    objs << main_obj

    lib_flags = if OS.mac?
      ["-framework", "CoreFoundation", "-framework", "Security"]
    else
      ["-lpthread", "-ldl"]
    end
    lib_flags += ["-L#{formula_opt_lib("lz4")}", "-llz4"]
    system cxx, *objs, rust_lib, "-o", "#{buildpath}/magiskboot", *lib_flags

    bin.install "#{buildpath}/magiskboot"
  end

  test do
    assert_match "MagiskBoot", shell_output("#{bin}/magiskboot 2>&1", 1)
    (testpath/"test.txt").write "test"
    assert_match(/^[0-9a-f]{40}$/, shell_output("#{bin}/magiskboot sha1 #{testpath}/test.txt").chomp)
  end
end
