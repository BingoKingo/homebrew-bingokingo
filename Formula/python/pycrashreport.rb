class Pycrashreport < Formula
  include Language::Python::Virtualenv
  desc "Python3 parser for Apple's crash reports"
  homepage "https://github.com/doronz88/pycrashreport/"
  url "https://files.pythonhosted.org/packages/6b/d4/5aa49d35b7fec5cc42c19a005b2a40499f6043702918ea5bc1fef76b0d84/pycrashreport-1.2.5.tar.gz"
  sha256 "129a5dd4afc389ecfe627d2f5fef9b9a9ad8ea5c3f438943df27b9edcbf4690f"
  license "GPL-3.0-or-later"
  head "https://github.com/doronz88/pycrashreport.git", branch: "master"

  depends_on "python-setuptools"
  depends_on "python@3.13"

  resource "cached-property" do
    url "https://files.pythonhosted.org/packages/76/4b/3d870836119dbe9a5e3c9a61af8cc1a8b69d75aea564572e385882d5aefb/cached_property-2.0.1.tar.gz"
    sha256 "484d617105e3ee0e4f1f58725e72a8ef9e93deee462222dbd51cd91230897641"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/b9/2e/0090cbf739cee7d23781ad4b89a9894a41538e4fcf4c31dcdd705b78eb8b/click-8.1.8.tar.gz"
    sha256 "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a"
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

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"pycrashreport", "--help"
  end
end
