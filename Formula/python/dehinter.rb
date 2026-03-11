class Dehinter < Formula
  include Language::Python::Virtualenv

  desc "Tool for the removal of TrueType instruction sets (hints) in fonts"
  homepage "https://github.com/source-foundry/dehinter/"
  url "https://files.pythonhosted.org/packages/89/bd/5c97cd4e8f1251242f828b9e3d7f8534c5bc5992b51806d23da236cb94ec/dehinter-4.0.0.tar.gz"
  sha256 "4510ff196caf179052ba578fe43e557024f6d6ce52952920e13e7e6eef74d768"
  license "Apache-2.0"
  head "https://github.com/source-foundry/dehinter.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "f0f542ef7a127397c6bba223a8ea11b5768fefb1d8fd55a1b779dbc7135253d3"
  end

  depends_on "fonttools"
  depends_on "python@3.14"

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/5a/96/686339e0fda8142b7ebed39af53f4a5694602a729662f42a6209e3be91d0/fonttools-4.62.0.tar.gz"
    sha256 "0dc477c12b8076b4eb9af2e440421b0433ffa9e1dcb39e0640a6c94665ed1098"
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
