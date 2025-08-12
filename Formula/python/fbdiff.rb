class Fbdiff < Formula
  include Language::Python::Virtualenv
  desc "Tool to show a brief summary of table differences in OpenType fonts"
  homepage "https://github.com/justvanrossum/fbdiff/"
  url "https://files.pythonhosted.org/packages/9d/2e/18dffe27f6865a0eb662e1bbe3ece7d33ae97213019b20eeb62fc5e3dd96/fbdiff-0.8.6.tar.gz"
  sha256 "d5b17d8d453e2dfdb00c7ffaa9f8f76657460fc9e5cd0d43b4810e99eef77731"
  license "Apache-2.0"
  head "https://github.com/justvanrossum/fbdiff.git", branch: "master"

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
    system bin/"fbdiff", "-h"
  end
end
