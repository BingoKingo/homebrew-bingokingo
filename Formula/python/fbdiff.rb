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
    sha256 cellar: :any_skip_relocation, all: "8d4c40e711ef6ea508d45ceb7938ee4b0d5b224e7fe61943bea2540c359f26e4"
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
    output = shell_output("#{bin}/fbdiff -h")
    assert_match "usage", output
    assert_match "Compare the binary tables of two OpenType fonts.", output
    assert_match "positional arguments", output
    assert_match "options", output
  end
end
