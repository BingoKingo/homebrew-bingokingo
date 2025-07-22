class AppleCompress < Formula
  include Language::Python::Virtualenv
  desc "Python bindings for Apple's libcompression"
  homepage "https://github.com/m1stadev/apple-compress/"
  url "https://files.pythonhosted.org/packages/91/14/cdb0bdb6147a019d2d8a1e144910c6a8d257d0e58f63bbd105bda0fce7dc/apple_compress-0.2.3.tar.gz"
  sha256 "a1c855cec8bd73210ae9522c53a841ca515ded2f0c9d5b4e728d0d93fee46a29"
  license "MIT"
  head "https://github.com/m1stadev/apple-compress.git", branch: "master"

  depends_on "python@3.13"

  resource "click" do
    url "https://files.pythonhosted.org/packages/60/6c/8ca2efa64cf75a977a0d7fac081354553ebe483345c734fb6b6515d96bbc/click-8.2.1.tar.gz"
    sha256 "27c491cc05d968d271d5a1db13e3b5a184636d9d930f148c50b038f0d0646202"
  end

  resource "loguru" do
    url "https://files.pythonhosted.org/packages/3a/05/a1dae3dffd1116099471c643b8924f5aa6524411dc6c63fdae648c4f1aca/loguru-0.7.3.tar.gz"
    sha256 "19480589e77d47b8d85b2c827ad95d49bf31b0dcde16593892eb51dd18706eb6"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"acompress", "-h"
  end
end
