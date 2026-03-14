class PandocSecnos < Formula
  include Language::Python::Virtualenv

  desc "Pandoc filter for numbering section references"
  homepage "https://github.com/tomduck/pandoc-secnos/"
  url "https://files.pythonhosted.org/packages/07/04/34f10643d02bbbb9843342f19bf013a3b5cf014e08215e3f9ab7a5721215/pandoc-secnos-2.2.2.tar.gz"
  sha256 "16b7fec4cb076ab800042c8fb3a42a45e654651f0261d99560868e157ffa107c"
  license "GPL-3.0-or-later"
  head "https://github.com/tomduck/pandoc-secnos.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "292421cec9a52b73ed7b0c4f37d809b039296277b4c686280569d4efbff76664"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f5f9c64cc03928a9ec2c7ff373d0fb03107e8d0c30e7787c09a9e0b1cfe1c533"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "e0e758eb475b73df85f422fbfe90b58dce5184c0f067811cca840346fc60bf7e"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "b3aa01eb583c959e0f3f0eaf05ded9aab67ab3231ffec19fa25262e8db973274"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "de8a077dce6454e9062fd2f05523278f21503a2a9684f08e91132ba6ed405c4c"
  end

  deprecate! date: "2020-08-08", because: :unmaintained
  depends_on "pandoc"
  depends_on "python@3.14"

  resource "pandoc-xnos" do
    url "https://files.pythonhosted.org/packages/f8/67/2f775963c0959f43821c4242e66143d42f39a01ac8e0c17f7d67ed126df7/pandoc-xnos-2.5.0.tar.gz"
    sha256 "7c18738c899e4ecec573dc6565abd8d43281fc894d41b82743d51df3dde250ae"
    patch :DATA
  end

  resource "pandocfilters" do
    url "https://files.pythonhosted.org/packages/70/6f/3dd4940bbe001c06a65f88e36bad298bc7a0de5036115639926b0c5c0458/pandocfilters-1.5.1.tar.gz"
    sha256 "002b4a555ee4ebc03f8b66307e287fa492e4a77b4ea14d3f934328297bb4939e"
  end

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/90/c7/6dc0a455d111f68ee43f27793971cf03fe29b6ef972042549db29eec39a2/psutil-5.9.8.tar.gz"
    sha256 "6be126e3225486dff286a8fb9a06246a5253f4c7c53b475ea5f5ac934e64194c"
  end

  patch do
    url "https://github.com/BingoKingo/homebrew-bingokingo/raw/test/Patches/pandoc-secnos/pandoc-secnos-2.2.2.diff"
    sha256 "cb747e349f9276de250bba1630ebef9f630736cc5c9cd929c41003e6956a2eaa"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/pandoc-secnos -h")
    assert_match "usage", output
    assert_match "Pandoc section numbers filter.", output
    assert_match "positional arguments", output
    assert_match "options", output
    version_output = shell_output("#{bin}/pandoc-secnos --version")
    assert_match "pandoc-secnos #{version}", version_output
  end
end
__END__
diff --git a/pandocxnos/core.py b/pandocxnos/core.py
index d58f3f4..d2af146 100644
--- a/pandocxnos/core.py
+++ b/pandocxnos/core.py
@@ -171,7 +171,7 @@ def _get_pandoc_version(pandocversion, doc):
             pass
 
     # Test `pandocversion` and if it is OK then return it
-    pattern = re.compile(r'^[1-2]\.[0-9]+(?:\.[0-9]+)?(?:\.[0-9]+)?$')
+    pattern = re.compile(r'^[1-3]\.[0-9]+(?:\.[0-9]+)?(?:\.[0-9]+)?$')
     if pandocversion is not None:
         if pattern.match(pandocversion):
             return pandocversion