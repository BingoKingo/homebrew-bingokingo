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
    url "https://files.pythonhosted.org/packages/25/ae/92e9968ad23205389ec6bd82e2d4fca3817f1cdef34e10aa8d529ef8b1d7/blessed-1.20.0.tar.gz"
    sha256 "2cdd67f8746e048f00df47a2880f4d6acbcdb399031b604e34ba8f71d5787680"
  end

  resource "enlighten" do
    url "https://files.pythonhosted.org/packages/75/b5/f73dc2c4c2990145a094dbecc561023a5230b28191f1a8b917f92fc1fb7c/enlighten-1.13.0.tar.gz"
    sha256 "ee718daac6873c83fd3706bce77da472c776a51e0d6f5f86f7e61e27f9ad166a"
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
    url "https://files.pythonhosted.org/packages/13/52/13b9db4a913eee948152a079fe58d035bd3d1a519584155da8e786f767e6/pycryptodome-3.21.0.tar.gz"
    sha256 "f7787e0d469bdae763b876174cf2e6c0f7be79808af26b1da96f1a64bcf47297"
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
