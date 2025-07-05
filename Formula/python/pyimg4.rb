class Pyimg4 < Formula
  include Language::Python::Virtualenv
  desc "Tool for parsing Apple's Image4 format"
  homepage "https://github.com/m1stadev/PyIMG4/"
  url "https://files.pythonhosted.org/packages/de/4e/92d5b9c1b95d042c58cebd429eaa8fcd19c09c6e3126f759a9203698419d/pyimg4-0.8.6.tar.gz"
  sha256 "7609940e023f395cbe8f39ffefb053d6168a001cad320627e641bf247c709d22"
  license "MIT"
  head "https://github.com/m1stadev/PyIMG4.git", branch: "master"

  depends_on "python@3.13"

  resource "apple-compress" do
    url "https://files.pythonhosted.org/packages/91/14/cdb0bdb6147a019d2d8a1e144910c6a8d257d0e58f63bbd105bda0fce7dc/apple_compress-0.2.3.tar.gz"
    sha256 "a1c855cec8bd73210ae9522c53a841ca515ded2f0c9d5b4e728d0d93fee46a29"
  end

  resource "asn1" do
    url "https://files.pythonhosted.org/packages/33/4e/75335477a1fcd4f2d86d672afebaadee25e672c4f1f319434184f3d3f556/asn1-2.7.1.tar.gz"
    sha256 "c00e37a58d25912dc7c7536770490644ab8e0305f5adc28cf7eebee32e2703c2"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/b9/2e/0090cbf739cee7d23781ad4b89a9894a41538e4fcf4c31dcdd705b78eb8b/click-8.1.8.tar.gz"
    sha256 "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a"
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

  resource "pycryptodome" do
    url "https://files.pythonhosted.org/packages/13/52/13b9db4a913eee948152a079fe58d035bd3d1a519584155da8e786f767e6/pycryptodome-3.21.0.tar.gz"
    sha256 "f7787e0d469bdae763b876174cf2e6c0f7be79808af26b1da96f1a64bcf47297"
  end

  resource "pylzss" do
    url "https://files.pythonhosted.org/packages/dc/6c/116032bd82d6a90bbaf449cd8cdf4e59038f8576193c82e17197b408f934/pylzss-0.3.8.tar.gz"
    sha256 "ff87bd93265fa2cda5532554d7df19d0e49c86850503407c2e2603eda0d01d48"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"pyimg4", "--help"
  end
end
