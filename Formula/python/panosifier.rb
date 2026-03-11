class Panosifier < Formula
  include Language::Python::Virtualenv

  desc "Panose data editor for fonts"
  homepage "https://github.com/source-foundry/panosifier/"
  url "https://files.pythonhosted.org/packages/2c/9c/02f15854a93bf931b4db5e1de61631743285774b19f7d31fe8b7cbc561da/panosifier-1.0.1.tar.gz"
  sha256 "d11e6b50ae1ddfc210dfbc0cace621f63d5ab5cf13194c7fd346e54aaa0941f6"
  license "Apache-2.0"
  head "https://github.com/source-foundry/panosifier.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "e687d66ca8738fe4804f6e8366c4344e7828c8f062b4830b19fb6f2a67a72459"
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
    output = shell_output("#{bin}/panosifier -h")
    assert_match "usage", output
    assert_match "Panose data editor for fonts", output
    assert_match "positional arguments", output
    assert_match "options", output
    version_output = shell_output("#{bin}/panosifier -v")
    assert_match "panosifier v#{version}", version_output
  end
end
