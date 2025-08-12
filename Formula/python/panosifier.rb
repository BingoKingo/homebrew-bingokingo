class Panosifier < Formula
  include Language::Python::Virtualenv
  desc "Panose data editor for fonts"
  homepage "https://github.com/source-foundry/panosifier/"
  url "https://files.pythonhosted.org/packages/2c/9c/02f15854a93bf931b4db5e1de61631743285774b19f7d31fe8b7cbc561da/panosifier-1.0.1.tar.gz"
  sha256 "d11e6b50ae1ddfc210dfbc0cace621f63d5ab5cf13194c7fd346e54aaa0941f6"
  license "Apache-2.0"
  head "https://github.com/source-foundry/panosifier.git", branch: "main"

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
    system bin/"panosifier", "-h"
  end
end
