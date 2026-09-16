class GitRemoteRcloneReds < Formula
  include Language::Python::Virtualenv

  desc "Git remote helper for rclone-supported services"
  homepage "https://github.com/redstreet/git-remote-rclone/"
  url "https://files.pythonhosted.org/packages/24/f6/d5b3601c465bd51ee2c1c9d8496997e42e90f22f3e85828e8bbd7e907c8b/git_remote_rclone_reds-0.3.tar.gz"
  sha256 "6c3624172570cd293ecdcf3c88459f8adc759717fcac3f00405f1bd190493cbb"
  license "GPL-3.0-or-later"
  head "https://github.com/redstreet/git-remote-rclone.git", branch: "main"

  depends_on "python@3.14"
  depends_on "rclone"

  patch :DATA

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      [F] Successor of https://github.com/datalad/git-remote-rclone
    EOS
  end

  test do
    system bin/"git-remote-rclone", "-h"
  end
end
__END__
diff --git a/git-remote-rclone b/git-remote-rclone
index 0b30902..48894cb
--- a/git-remote-rclone
+++ b/git-remote-rclone
@@ -39,6 +39,10 @@ class RCloneRemote(object):
         outstream: Stream to communicate outcomes to Git.
         errstream: Stream for logging.
         """
+        if not url.startswith('rclone://'):
+            raise ValueError('Unsupported URL scheme: {}'.format(url))
+        remote = url[9:]
+
         self.parsed_url = urlparse(url)
         self.remote = remote
         # internal logic relies on workdir to be an absolute path
@@ -236,6 +240,8 @@ class RCloneRemote(object):
             # ensure we have a repo
             self.repodir.mkdir()
             subprocess.run(['git', 'init', '--bare', '--quiet'], env=env, check=True)
+            HEAD_ref = self.run_cmd(['git', 'symbolic-ref', 'HEAD'], env=os.environ, check=True).strip()
+            subprocess.run(['git', 'symbolic-ref', 'HEAD', HEAD_ref], env=env, check=True)
 
         # which refs did we have in the mirror before the import?
         before = self.run_cmd(['git', 'for-each-ref', "--format= %(refname) %(objectname) "])
