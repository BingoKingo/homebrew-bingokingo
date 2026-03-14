class Nsz < Formula
  include Language::Python::Virtualenv

  desc "Homebrew compatible NSP/XCI compressor/decompressor"
  homepage "https://github.com/nicoboss/nsz/"
  url "https://files.pythonhosted.org/packages/5f/ec/83f85c0ba48227db5b2b9501dd75b8ea1ed9d44f72c6fa52e19d6b85a5ad/nsz-4.6.1.tar.gz"
  sha256 "456e3b33ff1fa9455376768dad588046a4530c8c1c87416607e6ba7221e6ba3f"
  license "MIT"
  head "https://github.com/nicoboss/nsz.git", branch: "master"

  depends_on "libglu" => :build
  depends_on "mesa" => :build
  depends_on "pkgconf" => :build
  depends_on "python-setuptools" => :build
  depends_on "certifi"
  depends_on "docutils"
  depends_on "pygments"
  depends_on "python@3.14"

  pypi_packages extra_packages: %w[kivy six]

  resource "blessed" do
    url "https://files.pythonhosted.org/packages/68/5c/92dc10a25a4eafb4b9bef5dad522a0b7d5d5b55d2d76f9a6721b2e49ca2c/blessed-1.33.0.tar.gz"
    sha256 "c732a1043042d84f411423a1a7b74643e1dd3a2271bd6e5955682dd4a321b0ef"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/af/2d/7bf41579a8986e348fa033a31cdd0e4121114f6bce2457e8876010b092dd/certifi-2026.2.25.tar.gz"
    sha256 "e887ab5cee78ea814d3472169153c2d12cd43b14bd03329a39a9c6e2e80bfba7"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/1d/35/02daf95b9cd686320bb622eb148792655c9412dbb9b67abb5694e5910a24/charset_normalizer-3.4.5.tar.gz"
    sha256 "95adae7b6c42a6c5b5b559b1a99149f090a57128155daeea91732c8d970d8644"
  end

  resource "docutils" do
    url "https://files.pythonhosted.org/packages/ae/b6/03bb70946330e88ffec97aefd3ea75ba575cb2e762061e0e62a213befee8/docutils-0.22.4.tar.gz"
    sha256 "4db53b1fde9abecbb74d91230d32ab626d94f6badfc575d6db9194a49df29968"
  end

  resource "enlighten" do
    url "https://files.pythonhosted.org/packages/8d/87/50b1152a85e3dca202e9e28ba2594c03edce8b9e74187b3aef5b98e4b631/enlighten-1.14.1.tar.gz"
    sha256 "85c35412a9a4f3886b3337d41f813441fab9a30d9f5b5f0c015bd078a4411473"
  end

  resource "filetype" do
    url "https://files.pythonhosted.org/packages/bb/29/745f7d30d47fe0f251d3ad3dc2978a23141917661998763bebb6da007eb1/filetype-1.2.0.tar.gz"
    sha256 "66b56cd6474bf41d8c54660347d37afcc3f7d1970648de365c102ef77548aadb"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/6f/6d/0703ccc57f3a7233505399edb88de3cbd678da106337b9fcde432b65ed60/idna-3.11.tar.gz"
    sha256 "795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902"
  end

  resource "kivy" do
    url "https://files.pythonhosted.org/packages/de/48/c40f023dc103bdbd56db11facbb2d0ecbf4b019f7392875ee2a8227cb51e/Kivy-2.3.1.tar.gz"
    sha256 "0833949e3502cdb4abcf9c1da4384674045ad7d85644313aa1ee7573f3b4f9d9"
  end

  resource "kivy-garden" do
    url "https://files.pythonhosted.org/packages/0b/33/9ad8dab579e7c48e95e7de6bf00b5e671c4ee1c0a57df140fb2d145ffe36/Kivy%20Garden-0.1.5.tar.gz"
    sha256 "2b8377378e87501d5d271f33d94f0e44c089884572c64f89c9d609b1f86a2748"
  end

  resource "prefixed" do
    url "https://files.pythonhosted.org/packages/48/ae/296470eca349da35bdec573e54320afa2b5b099c582e5d97be8bccac247e/prefixed-0.9.0.tar.gz"
    sha256 "164403fa9ebc83280bbc4705f4b243a28837e164310b4e65c38ccab1ebafeeb3"
  end

  resource "pycryptodome" do
    url "https://files.pythonhosted.org/packages/8e/a6/8452177684d5e906854776276ddd34eca30d1b1e15aa1ee9cefc289a33f5/pycryptodome-3.23.0.tar.gz"
    sha256 "447700a657182d60338bab09fdb27518f8856aecd80ae4c6bdddb67ff5da44ef"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/b0/77/a5b8c569bf593b0140bde72ea885a803b82086995367bf2037de0159d924/pygments-2.19.2.tar.gz"
    sha256 "636cb2477cec7f8952536970bc533bc43743542f70392ae026374600add5b887"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/c9/74/b3ff8e6c8446842c3f5c837e9c3dfcfe2018ea6ecef224c710c85ef728f4/requests-2.32.5.tar.gz"
    sha256 "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf"
  end

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/4f/db/cfac1baf10650ab4d1c111714410d2fbb77ac5a616db26775db562c8fab2/setuptools-82.0.1.tar.gz"
    sha256 "7d872682c5d01cfde07da7bccc7b65469d3dca203318515ada1de5eda35efbf9"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/c7/24/5f1b3bdffd70275f6661c76461e25f024d5a38a46f04aaca912426a2b1d3/urllib3-2.6.3.tar.gz"
    sha256 "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed"
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
    output = shell_output("#{bin}/nsz -h")
    assert_match "usage", output
    assert_match "positional arguments", output
    assert_match "options", output
  end
end
