class Pykdebugparser < Formula
  include Language::Python::Virtualenv
  desc "Kdebug events and ktraces parser"
  homepage "https://github.com/matan1008/pykdebugparser/"
  url "https://files.pythonhosted.org/packages/fe/f0/aadf94718a4f768d2928f31544a16fbed5c0cb5e4bc2cf0f21939fbd1caa/pykdebugparser-1.2.7.tar.gz"
  sha256 "bdf10a1a5b8617265301359162c798a72db11403facfd13e22717cd733e21c54"
  license "MIT"
  head "https://github.com/matan1008/pykdebugparser.git", branch: "main"

  # depends_on "pygments"
  depends_on "python@3.13"

  resource "click" do
    url "https://files.pythonhosted.org/packages/60/6c/8ca2efa64cf75a977a0d7fac081354553ebe483345c734fb6b6515d96bbc/click-8.2.1.tar.gz"
    sha256 "27c491cc05d968d271d5a1db13e3b5a184636d9d930f148c50b038f0d0646202"
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
    url "https://files.pythonhosted.org/packages/ca/6c/3d75c196ac07ac8749600b60b03f4f6094d54e132c4d94ebac6ee0e0add0/termcolor-3.1.0.tar.gz"
    sha256 "6a6dd7fbee581909eeec6a756cff1d7f7c376063b14e4a298dc4980309e55970"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "pykdebugparser", "--help"
  end
end
