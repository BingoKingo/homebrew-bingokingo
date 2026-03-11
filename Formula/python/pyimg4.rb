class Pyimg4 < Formula
  include Language::Python::Virtualenv

  desc "Tool for parsing Apple's Image4 format"
  homepage "https://github.com/m1stadev/PyIMG4/"
  url "https://files.pythonhosted.org/packages/3c/5c/69bad79b4e9d7be46063e9ea15e82c79ae0dec90811501453003588aab62/pyimg4-0.8.8.tar.gz"
  sha256 "aafebb2bc7922f6cf551b1b9e982d2da039cbeb08f0a2e2048a1818d51c76da1"
  license "MIT"
  head "https://github.com/m1stadev/PyIMG4.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "1ec9df4f09d542e0486a9fc98eb00cb0631a82c80d47c423747290fbd7db9efb"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b95506f3f66c80c20ce1d2b4c7e2538ada9cbc23cf08415f5fc1bda3aca9fdbc"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "638fb10a077a5cc6af6533dce13d11a7f8e7d4e308fec93a39dfc91be7a8ae14"
  end

  depends_on "maturin" => :build
  depends_on "numpy"
  depends_on "python@3.14"

  pypi_packages extra_packages: %w[lzfse numpy]

  resource "apple-compress" do
    url "https://files.pythonhosted.org/packages/91/14/cdb0bdb6147a019d2d8a1e144910c6a8d257d0e58f63bbd105bda0fce7dc/apple_compress-0.2.3.tar.gz"
    sha256 "a1c855cec8bd73210ae9522c53a841ca515ded2f0c9d5b4e728d0d93fee46a29"
  end

  resource "asn1" do
    url "https://files.pythonhosted.org/packages/00/35/9d0709bf09340ddb1796dfc52d1b1ef2f18e690b5cbf32b7be02c702532c/asn1-2.8.0.tar.gz"
    sha256 "adf77ddc2707cf420c0eae3b99ee30e913afcf0936467d42669820ce6b7d150a"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/3d/fa/656b739db8587d7b5dfa22e22ed02566950fbfbcdc20311993483657a5c0/click-8.3.1.tar.gz"
    sha256 "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
  end

  resource "enum-compat" do
    url "https://files.pythonhosted.org/packages/41/46/8ed2368976d934652d8f33f1fdd86f5580fab45e890c90a848e83097a093/enum-compat-0.0.3.tar.gz"
    sha256 "3677daabed56a6f724451d585662253d8fb4e5569845aafa8bb0da36b1a8751e"
  end

  resource "loguru" do
    url "https://files.pythonhosted.org/packages/3a/05/a1dae3dffd1116099471c643b8924f5aa6524411dc6c63fdae648c4f1aca/loguru-0.7.3.tar.gz"
    sha256 "19480589e77d47b8d85b2c827ad95d49bf31b0dcde16593892eb51dd18706eb6"
  end

  resource "lzfse" do
    url "https://files.pythonhosted.org/packages/11/c6/a57f4134fa1afb7e658c58a2401838c811445a9fdc657008b4850d4e47d7/lzfse-0.4.2.tar.gz"
    sha256 "c6895f8ca13eedd2e18b6e0c987c9468115030898409bc44a7aa8d4f4a42ceab"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/10/8b/c265f4823726ab832de836cdd184d0986dcf94480f81e8739692a7ac7af2/numpy-2.4.3.tar.gz"
    sha256 "483a201202b73495f00dbc83796c6ae63137a9bdade074f7648b3e32613412dd"
  end

  resource "pycryptodome" do
    url "https://files.pythonhosted.org/packages/8e/a6/8452177684d5e906854776276ddd34eca30d1b1e15aa1ee9cefc289a33f5/pycryptodome-3.23.0.tar.gz"
    sha256 "447700a657182d60338bab09fdb27518f8856aecd80ae4c6bdddb67ff5da44ef"
  end

  resource "pylzss" do
    url "https://files.pythonhosted.org/packages/7d/dc/9ae75ede398b7adf538f2d1dca0f96c645c4e96789f8039340a0ed6a8a8f/pylzss-0.3.4.tar.gz"
    sha256 "16818631742488e53a34fda0d402d80edb2b812e11877801e21a9e5ce9b9db1c"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/pyimg4 --help")
    assert_match "Usage", output
    assert_match "A Python CLI tool for parsing Apple's Image4 format.", output
    assert_match "Options", output
    assert_match "Commands", output
    version_output = shell_output("#{bin}/pyimg4 --version")
    assert_match "PyIMG4 #{version}", version_output
  end
end
