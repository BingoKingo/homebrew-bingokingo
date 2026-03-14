class PandocEqnos < Formula
  include Language::Python::Virtualenv

  desc "Pandoc filter for numbering equations and equation references"
  homepage "https://github.com/tomduck/pandoc-eqnos/"
  url "https://files.pythonhosted.org/packages/1e/4d/8958ccf9e6383c1a0b91dd6584711c130884a4f5ae3b85565613274ff4f0/pandoc-eqnos-2.5.0.tar.gz"
  sha256 "f0cc9250743342cef234cab27e0006a524bf155ecaf9897adf07396d32da94c7"
  license "GPL-3.0-or-later"
  head "https://github.com/tomduck/pandoc-eqnos.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "a6d8e76ae45ad2015d716e5ed00363eb2b524589517a3f587b0ee5f135943a4e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c2ab04e4d28b7d1bd4c5706efa24141acedb82332d9eb72dce2fc479326f3723"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "9edc3650073872f75f20328afdbe0afd30af94ad17ebc1400614d628699e8ccf"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "b2f837737db7d001ea0225cbb2bbb02d815394031a5f8f6ed57a1e8377bc7fe1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b27dee8b83dc11131ae057b1c48626c014f7057520315565460e4046efec959a"
  end

  deprecate! date: "2020-12-06", because: :unmaintained
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
    output = shell_output("#{bin}/pandoc-eqnos -h")
    assert_match "usage", output
    assert_match "Pandoc equations numbers filter.", output
    assert_match "positional arguments", output
    assert_match "options", output
    version_output = shell_output("#{bin}/pandoc-eqnos --version")
    assert_match "pandoc-eqnos #{version}", version_output
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