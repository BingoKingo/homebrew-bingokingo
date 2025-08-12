class Dehinter < Formula
  include Language::Python::Virtualenv
  desc "Tool for the removal of TrueType instruction sets (hints) in fonts"
  homepage "https://github.com/source-foundry/dehinter/"
  url "https://files.pythonhosted.org/packages/89/bd/5c97cd4e8f1251242f828b9e3d7f8534c5bc5992b51806d23da236cb94ec/dehinter-4.0.0.tar.gz"
  sha256 "4510ff196caf179052ba578fe43e557024f6d6ce52952920e13e7e6eef74d768"
  license "Apache-2.0"
  head "https://github.com/source-foundry/dehinter.git", branch: "master"

  depends_on "fonttools"
  depends_on "python@3.13"

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/8a/27/ec3c723bfdf86f34c5c82bf6305df3e0f0d8ea798d2d3a7cb0c0a866d286/fonttools-4.59.0.tar.gz"
    sha256 "be392ec3529e2f57faa28709d60723a763904f71a2b63aabe14fee6648fe3b14"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"dehinter", "-h"
  end
end
