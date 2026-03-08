class AppleCompress < Formula
  include Language::Python::Virtualenv

  desc "Python bindings for Apple's libcompression"
  homepage "https://github.com/m1stadev/apple-compress/"
  url "https://files.pythonhosted.org/packages/91/14/cdb0bdb6147a019d2d8a1e144910c6a8d257d0e58f63bbd105bda0fce7dc/apple_compress-0.2.3.tar.gz"
  sha256 "a1c855cec8bd73210ae9522c53a841ca515ded2f0c9d5b4e728d0d93fee46a29"
  license "MIT"
  head "https://github.com/m1stadev/apple-compress.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "f185ccc614213c529dda69481547873b01e9732117c755885d0ce935ce428baa"
  end

  depends_on "python@3.14"

  resource "click" do
    url "https://files.pythonhosted.org/packages/3d/fa/656b739db8587d7b5dfa22e22ed02566950fbfbcdc20311993483657a5c0/click-8.3.1.tar.gz"
    sha256 "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
  end

  resource "loguru" do
    url "https://files.pythonhosted.org/packages/3a/05/a1dae3dffd1116099471c643b8924f5aa6524411dc6c63fdae648c4f1aca/loguru-0.7.3.tar.gz"
    sha256 "19480589e77d47b8d85b2c827ad95d49bf31b0dcde16593892eb51dd18706eb6"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/acompress -h")
    assert_match "Usage", output
    assert_match "A Python CLI tool for compression using Apple's libcompression.", output
    assert_match "Options", output
    version_output = shell_output("#{bin}/acompress --version")
    assert_match "acompress 0.2.3", version_output
  end
end
