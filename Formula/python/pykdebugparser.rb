class Pykdebugparser < Formula
  include Language::Python::Virtualenv
  desc "Kdebug events and ktraces parser"
  homepage "https://github.com/matan1008/pykdebugparser/"
  url "https://files.pythonhosted.org/packages/15/83/5c4b37587a073149285f700978597bcd6317f0991460fa2053d37c28f9dd/pykdebugparser-1.2.4.tar.gz"
  sha256 "338acf59c228600bce05cf3cbaf39439faa9bc61011906513099993da66ed567"
  license "MIT"
  head "https://github.com/matan1008/pykdebugparser.git", branch: "main"

  # depends_on "pygments"
  depends_on "python@3.13"

  resource "click" do
    url "https://files.pythonhosted.org/packages/b9/2e/0090cbf739cee7d23781ad4b89a9894a41538e4fcf4c31dcdd705b78eb8b/click-8.1.8.tar.gz"
    sha256 "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a"
  end

  resource "construct" do
    url "https://files.pythonhosted.org/packages/02/77/8c84b98eca70d245a2a956452f21d57930d22ab88cbeed9290ca630cf03f/construct-2.10.70.tar.gz"
    sha256 "4d2472f9684731e58cc9c56c463be63baa1447d674e0d66aeb5627b22f512c29"
  end

  resource "Pygments" do
    url "https://files.pythonhosted.org/packages/7c/2d/c3338d48ea6cc0feb8446d8e6937e1408088a72a39937982cc6111d17f84/pygments-2.19.1.tar.gz"
    sha256 "61c16d2a8576dc0649d9f39e089b5f02bcd27fba10d8fb4dcc28173f7a45151f"
  end

  resource "termcolor" do
    url "https://files.pythonhosted.org/packages/37/72/88311445fd44c455c7d553e61f95412cf89054308a1aa2434ab835075fc5/termcolor-2.5.0.tar.gz"
    sha256 "998d8d27da6d48442e8e1f016119076b690d962507531df4890fcd2db2ef8a6f"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "pykdebugparser", "--help"
  end
end
