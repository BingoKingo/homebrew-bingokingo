class LaPanic < Formula
  include Language::Python::Virtualenv
  desc "AppleOS Kernel Panic Parser"
  homepage "https://gitlab.com/yanivhasbanidev/la_panic/"
  url "https://files.pythonhosted.org/packages/85/28/757e1ccd939162caa27c8a6173d490deb986c38a7fd73fe2f264f6d7485d/la-panic-0.5.0.tar.gz"
  sha256 "5239025d1e96aaed1fbd1c4a5d35572fd70cf42ddd68839ff1e4f1d21e3e279b"
  license "GPL-3.0-or-later"
  head "https://gitlab.com/yanivhasbanidev/la_panic.git", branch: "main"

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

  def install
    virtualenv_install_with_resources
    bin.install_symlink "la_panic" => "la-panic"
  end

  test do
    system bin/"la_panic", "--help"
  end
end
