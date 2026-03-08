class Pycrashreport < Formula
  include Language::Python::Virtualenv

  desc "Python3 parser for Apple's crash reports"
  homepage "https://github.com/doronz88/pycrashreport/"
  url "https://files.pythonhosted.org/packages/d5/0b/534e02c6badef117b5a4054c065b50e6055d833b983b024d57afb425b618/pycrashreport-1.2.7.tar.gz"
  sha256 "8f4d52d3292c1ec479fac589633d1477d19fbeb6ab01960969389c6a9c63ed7f"
  license "GPL-3.0-or-later"
  head "https://github.com/doronz88/pycrashreport.git", branch: "master"

  depends_on "python-setuptools" => :build
  depends_on "python@3.13"

  resource "cached-property" do
    url "https://files.pythonhosted.org/packages/76/4b/3d870836119dbe9a5e3c9a61af8cc1a8b69d75aea564572e385882d5aefb/cached_property-2.0.1.tar.gz"
    sha256 "484d617105e3ee0e4f1f58725e72a8ef9e93deee462222dbd51cd91230897641"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/3d/fa/656b739db8587d7b5dfa22e22ed02566950fbfbcdc20311993483657a5c0/click-8.3.1.tar.gz"
    sha256 "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
  end

  resource "coloredlogs" do
    url "https://files.pythonhosted.org/packages/cc/c7/eed8f27100517e8c0e6b923d5f0845d0cb99763da6fdee00478f91db7325/coloredlogs-15.0.1.tar.gz"
    sha256 "7c991aa71a4577af2f82600d8f8f3a89f936baeaf9b50a9c197da014e5bf16b0"
  end

  resource "humanfriendly" do
    url "https://files.pythonhosted.org/packages/cc/3f/2c29224acb2e2df4d2046e4c73ee2662023c58ff5b113c4c1adac0886c43/humanfriendly-10.0.tar.gz"
    sha256 "6b0b831ce8f15f7300721aa49829fc4e83921a9a301cc7f606be6686a2288ddc"
  end

  resource "la-panic" do
    url "https://files.pythonhosted.org/packages/85/28/757e1ccd939162caa27c8a6173d490deb986c38a7fd73fe2f264f6d7485d/la-panic-0.5.0.tar.gz"
    sha256 "5239025d1e96aaed1fbd1c4a5d35572fd70cf42ddd68839ff1e4f1d21e3e279b"
  end

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/82/f3/748f4d6f65d1756b9ae577f329c951cda23fb900e4de9f70900ced962085/setuptools-82.0.0.tar.gz"
    sha256 "22e0a2d69474c6ae4feb01951cb69d515ed23728cf96d05513d36e42b62b37cb"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"pycrashreport", "--help"
  end
end
