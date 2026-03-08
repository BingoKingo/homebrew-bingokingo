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
    url "https://files.pythonhosted.org/packages/ec/ca/cf17b88a8df95691275a3d77dc0a5ad9907f328ae53acbe6795da1b2f5ed/fonttools-4.61.1.tar.gz"
    sha256 "6675329885c44657f826ef01d9e4fb33b9158e9d93c537d84ad8399539bc6f69"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"panosifier", "-h"
  end
end
