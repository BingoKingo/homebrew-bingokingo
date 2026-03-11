class Pykdebugparser < Formula
  include Language::Python::Virtualenv

  desc "Kdebug events and ktraces parser"
  homepage "https://github.com/matan1008/pykdebugparser/"
  url "https://files.pythonhosted.org/packages/fe/f0/aadf94718a4f768d2928f31544a16fbed5c0cb5e4bc2cf0f21939fbd1caa/pykdebugparser-1.2.7.tar.gz"
  sha256 "bdf10a1a5b8617265301359162c798a72db11403facfd13e22717cd733e21c54"
  license "MIT"
  head "https://github.com/matan1008/pykdebugparser.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "4102c20ede7c32c42b4dea0aa2bfb8576adbb8f0e07da2b028f84b1f1b575df7"
  end

  depends_on "pygments"
  depends_on "python@3.14"

  resource "click" do
    url "https://files.pythonhosted.org/packages/3d/fa/656b739db8587d7b5dfa22e22ed02566950fbfbcdc20311993483657a5c0/click-8.3.1.tar.gz"
    sha256 "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
  end

  resource "construct" do
    url "https://files.pythonhosted.org/packages/02/77/8c84b98eca70d245a2a956452f21d57930d22ab88cbeed9290ca630cf03f/construct-2.10.70.tar.gz"
    sha256 "4d2472f9684731e58cc9c56c463be63baa1447d674e0d66aeb5627b22f512c29"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/b0/77/a5b8c569bf593b0140bde72ea885a803b82086995367bf2037de0159d924/pygments-2.19.2.tar.gz"
    sha256 "636cb2477cec7f8952536970bc533bc43743542f70392ae026374600add5b887"
  end

  resource "termcolor" do
    url "https://files.pythonhosted.org/packages/46/79/cf31d7a93a8fdc6aa0fbb665be84426a8c5a557d9240b6239e9e11e35fc5/termcolor-3.3.0.tar.gz"
    sha256 "348871ca648ec6a9a983a13ab626c0acce02f515b9e1983332b17af7979521c5"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/pykdebugparser --help")
    assert_match "Usage", output
    assert_match "Options", output
    assert_match "Commands", output
  end
end
