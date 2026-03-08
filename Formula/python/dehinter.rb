class Dehinter < Formula
  include Language::Python::Virtualenv

  desc "Tool for the removal of TrueType instruction sets (hints) in fonts"
  homepage "https://github.com/source-foundry/dehinter/"
  url "https://files.pythonhosted.org/packages/89/bd/5c97cd4e8f1251242f828b9e3d7f8534c5bc5992b51806d23da236cb94ec/dehinter-4.0.0.tar.gz"
  sha256 "4510ff196caf179052ba578fe43e557024f6d6ce52952920e13e7e6eef74d768"
  license "Apache-2.0"
  head "https://github.com/source-foundry/dehinter.git", branch: "master"

  depends_on "fonttools"
  depends_on "python@3.14"

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/ec/ca/cf17b88a8df95691275a3d77dc0a5ad9907f328ae53acbe6795da1b2f5ed/fonttools-4.61.1.tar.gz"
    sha256 "6675329885c44657f826ef01d9e4fb33b9158e9d93c537d84ad8399539bc6f69"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/dehinter -h")
    assert_match "usage", output
    assert_match "A tool for the removal of TrueType instruction sets (hints) in fonts", output
    assert_match "positional arguments", output
    assert_match "options", output
    version_output = shell_output("#{bin}/dehinter --version")
    assert_match "dehinter v#{version}", version_output
  end
end
