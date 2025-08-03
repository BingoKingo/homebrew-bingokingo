class Autosubset < Formula
  include Language::Python::Virtualenv
  desc "Automatic font subsetting for a provided text"
  homepage "https://gitlab.com/MarcelWaldvogel/autosubset/"
  url "https://files.pythonhosted.org/packages/5e/9a/cbef31056f9a562d40e4c75086fb08ce5486f8106e5ebf923d7cebdb113c/autosubset-0.3.0.tar.gz"
  sha256 "aa36d9f95dc22279db201259bfc26c4840d3764b2cd7870ddad6b0c6829a64fd"
  license "MIT"
  head "https://gitlab.com/MarcelWaldvogel/autosubset.git", branch: "main"

  depends_on "brotli"
  depends_on "fonttools"
  depends_on "python@3.13"

  resource "brotli" do
    url "https://files.pythonhosted.org/packages/2f/c2/f9e977608bdf958650638c3f1e28f85a1b075f075ebbe77db8555463787b/Brotli-1.1.0.tar.gz"
    sha256 "81de08ac11bcb85841e440c13611c00b67d3bf82698314928d0b676362546724"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/52/97/5735503e58d3816b0989955ef9b2df07e4c99b246469bd8b3823a14095da/fonttools-4.58.5.tar.gz"
    sha256 "b2a35b0a19f1837284b3a23dd64fd7761b8911d50911ecd2bdbaf5b2d1b5df9c"
  end

  resource "zopfli" do
    url "https://files.pythonhosted.org/packages/5e/7c/a8f6696e694709e2abcbccd27d05ef761e9b6efae217e11d977471555b62/zopfli-0.2.3.post1.tar.gz"
    sha256 "96484dc0f48be1c5d7ae9f38ed1ce41e3675fd506b27c11a6607f14b49101e99"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"autosubset", "-h"
  end
end
