class PythonSrt < Formula
  include Language::Python::Virtualenv

  desc "Parsing, modifying, and composing SRT files"
  homepage "https://github.com/cdown/srt/"
  url "https://files.pythonhosted.org/packages/66/b7/4a1bc231e0681ebf339337b0cd05b91dc6a0d701fa852bb812e244b7a030/srt-3.5.3.tar.gz"
  sha256 "4884315043a4f0740fd1f878ed6caa376ac06d70e135f306a6dc44632eed0cc0"
  license "MIT"
  head "https://github.com/cdown/srt.git", branch: "develop"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "939e3a911e5c5b25d401b5b099daf92ff85aadc82ad69987bfc1a61343d67c6a"
  end

  depends_on "python@3.14"

  patch :DATA

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/srt --help")
    assert_match "Available commands", output
    assert_match "- deduplicate", output
    assert_match "- ffplay", output
    assert_match "- file-transmit", output
    assert_match "- fixed-timeshift", output
    assert_match "- linear-timeshift", output
    assert_match "- lines-matching", output
    assert_match "- live-transmit", output
    assert_match "- mux", output
    assert_match "- normalise", output
    assert_match "- play", output
    assert_match "- process", output
    assert_match "- tunnel", output
  end
end
__END__
diff --git a/srt_tools/srt b/srt_tools/srt
index c8c21b5..f234602 100755
--- a/srt_tools/srt
+++ b/srt_tools/srt
@@ -14,11 +14,8 @@ def find_srt_commands_in_path():
     for path in paths:
         try:
             path_files = os.listdir(path)
-        except OSError as thrown_exc:
-            if thrown_exc.errno in (errno.ENOENT, errno.ENOTDIR):
-                continue
-            else:
-                raise
+        except (OSError, PermissionError):
+            continue
 
         for path_file in path_files:
             if path_file.startswith(SRT_BIN_PREFIX):