class Fbdiff < Formula
  include Language::Python::Virtualenv

  desc "Tool to show a brief summary of table differences in OpenType fonts"
  homepage "https://github.com/justvanrossum/fbdiff/"
  url "https://files.pythonhosted.org/packages/9d/2e/18dffe27f6865a0eb662e1bbe3ece7d33ae97213019b20eeb62fc5e3dd96/fbdiff-0.8.6.tar.gz"
  sha256 "d5b17d8d453e2dfdb00c7ffaa9f8f76657460fc9e5cd0d43b4810e99eef77731"
  license "Apache-2.0"
  head "https://github.com/justvanrossum/fbdiff.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "31e668b2cac64ea9a17d497dc8c98fc109c0399abddfa4aa7c50c34c94e65732"
  end

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
    output = shell_output("#{bin}/fbdiff -h")
    assert_match "usage", output
    assert_match "Compare the binary tables of two OpenType fonts.", output
    assert_match "positional arguments", output
    assert_match "options", output
  end
end
