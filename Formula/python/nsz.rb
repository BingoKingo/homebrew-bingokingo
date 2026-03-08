class Nsz < Formula
  include Language::Python::Virtualenv

  desc "Homebrew compatible NSP/XCI compressor/decompressor"
  homepage "https://github.com/nicoboss/nsz/"
  url "https://files.pythonhosted.org/packages/5f/ec/83f85c0ba48227db5b2b9501dd75b8ea1ed9d44f72c6fa52e19d6b85a5ad/nsz-4.6.1.tar.gz"
  sha256 "456e3b33ff1fa9455376768dad588046a4530c8c1c87416607e6ba7221e6ba3f"
  license "MIT"
  head "https://github.com/nicoboss/nsz.git", branch: "master"

  depends_on "python@3.13"
  depends_on "six"

  resource "blessed" do
    url "https://files.pythonhosted.org/packages/68/5c/92dc10a25a4eafb4b9bef5dad522a0b7d5d5b55d2d76f9a6721b2e49ca2c/blessed-1.33.0.tar.gz"
    sha256 "c732a1043042d84f411423a1a7b74643e1dd3a2271bd6e5955682dd4a321b0ef"
  end

  resource "enlighten" do
    url "https://files.pythonhosted.org/packages/8d/87/50b1152a85e3dca202e9e28ba2594c03edce8b9e74187b3aef5b98e4b631/enlighten-1.14.1.tar.gz"
    sha256 "85c35412a9a4f3886b3337d41f813441fab9a30d9f5b5f0c015bd078a4411473"
  end

  resource "kivy" do
    url "https://files.pythonhosted.org/packages/de/48/c40f023dc103bdbd56db11facbb2d0ecbf4b019f7392875ee2a8227cb51e/Kivy-2.3.1.tar.gz"
    sha256 "0833949e3502cdb4abcf9c1da4384674045ad7d85644313aa1ee7573f3b4f9d9"
  end

  resource "prefixed" do
    url "https://files.pythonhosted.org/packages/48/ae/296470eca349da35bdec573e54320afa2b5b099c582e5d97be8bccac247e/prefixed-0.9.0.tar.gz"
    sha256 "164403fa9ebc83280bbc4705f4b243a28837e164310b4e65c38ccab1ebafeeb3"
  end

  resource "pycryptodome" do
    url "https://files.pythonhosted.org/packages/8e/a6/8452177684d5e906854776276ddd34eca30d1b1e15aa1ee9cefc289a33f5/pycryptodome-3.23.0.tar.gz"
    sha256 "447700a657182d60338bab09fdb27518f8856aecd80ae4c6bdddb67ff5da44ef"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/35/a2/8e3becb46433538a38726c948d3399905a4c7cabd0df578ede5dc51f0ec2/wcwidth-0.6.0.tar.gz"
    sha256 "cdc4e4262d6ef9a1a57e018384cbeb1208d8abbc64176027e2c2455c81313159"
  end

  resource "zstandard" do
    url "https://files.pythonhosted.org/packages/fd/aa/3e0508d5a5dd96529cdc5a97011299056e14c6505b678fd58938792794b1/zstandard-0.25.0.tar.gz"
    sha256 "7713e1179d162cf5c7906da876ec2ccb9c3a9dcbdffef0cc7f70c3667a205f0b"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"nsz", "-h"
  end
end
