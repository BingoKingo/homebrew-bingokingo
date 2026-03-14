class PandocTablenos < Formula
  include Language::Python::Virtualenv

  desc "Pandoc filter for numbering tables and table references"
  homepage "https://github.com/tomduck/pandoc-tablenos/"
  url "https://files.pythonhosted.org/packages/e2/a3/1675f9bbba0982ea0bb3a31639795505e3bdc19e657dbcf9dec404808162/pandoc-tablenos-2.3.0.tar.gz"
  sha256 "23d08a1aac981aafbec696eb265e688426f9310f6e80976f379b2d9b2b5de1bc"
  license "GPL-3.0-or-later"
  head "https://github.com/tomduck/pandoc-tablenos.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "819344ebe0314d3a600d956a02bc8709d6c824aeb869d0d807239398480f37cc"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f836dac1122a5ce2270d529d645f3329d200e5607f8207b74c3c9d85837a0ed8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "55387764f361d8f1e00ce9de28696c1e342dbd1f4e5f43f6e5cf9c82862460a9"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "a7c0276aa587f1d162e59a59fc8e2f06da357926ad2cc88ae67633fb1b31a065"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "70726c8d2b4aa7f000b9f8a146e9a22efe04fc30bc7247efcb2417ce963b8fcf"
  end

  deprecate! date: "2020-11-11", because: :unmaintained
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

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/pandoc-tablenos -h")
    assert_match "usage", output
    assert_match "Pandoc table numbers filter.", output
    assert_match "positional arguments", output
    assert_match "options", output
    version_output = shell_output("#{bin}/pandoc-tablenos --version")
    assert_match "pandoc-tablenos #{version}", version_output
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