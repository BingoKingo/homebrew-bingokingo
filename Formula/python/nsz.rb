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
    url "https://files.pythonhosted.org/packages/0c/5e/3cada2f7514ee2a76bb8168c71f9b65d056840ebb711962e1ec08eeaa7b0/blessed-1.21.0.tar.gz"
    sha256 "ece8bbc4758ab9176452f4e3a719d70088eb5739798cd5582c9e05f2a28337ec"
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
    url "https://files.pythonhosted.org/packages/6c/63/53559446a878410fc5a5974feb13d31d78d752eb18aeba59c7fef1af7598/wcwidth-0.2.13.tar.gz"
    sha256 "72ea0c06399eb286d978fdedb6923a9eb47e1c486ce63e9b4e64fc18303972b5"
  end

  resource "zstandard" do
    url "https://files.pythonhosted.org/packages/ed/f6/2ac0287b442160a89d726b17a9184a4c615bb5237db763791a7fd16d9df1/zstandard-0.23.0.tar.gz"
    sha256 "b2d8c62d08e7255f68f7a740bae85b3c9b8e5466baa9cbf7f57f1cde0ac6bc09"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"nsz", "-h"
  end
end
