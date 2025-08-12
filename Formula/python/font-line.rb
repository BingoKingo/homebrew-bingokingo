class FontLine < Formula
  include Language::Python::Virtualenv
  desc "OpenType vertical metrics reporting and font line spacing adjustment tool"
  homepage "https://github.com/source-foundry/font-line/"
  url "https://files.pythonhosted.org/packages/52/71/b9defbaad1e61a6795de1b43127fc0925021ad1b77a50f80ea0620f3ffef/font-line-3.1.4.tar.gz"
  sha256 "21d8d64aa833fc237760d8f296e55fc5ad6ff3157db92679f2e91451e9abc8c6"
  head "https://github.com/source-foundry/font-line.git", branch: "master"

  depends_on "fonttools"
  depends_on "python@3.13"

  resource "commandlines" do
    url "https://files.pythonhosted.org/packages/b9/4c/d380f7f9aaa12175b189cfe087e823cd9aa2a99afc95a8d6e028142311c9/commandlines-0.4.1.tar.gz"
    sha256 "86b650b78470ac95966d7b1a9d215c16591bccb34b28ae2bb9026c3b4166fd64"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/8a/27/ec3c723bfdf86f34c5c82bf6305df3e0f0d8ea798d2d3a7cb0c0a866d286/fonttools-4.59.0.tar.gz"
    sha256 "be392ec3529e2f57faa28709d60723a763904f71a2b63aabe14fee6648fe3b14"
  end

  resource "standardstreams" do
    url "https://files.pythonhosted.org/packages/13/05/69fc5cd9273d842c46fcbfe13b0255aa0341046194b0df64cf94f6861052/standardstreams-0.2.0.tar.gz"
    sha256 "8650d89073af3103db1c65c6706705749f3959286a6246c16cfd51ccbaf12b4b"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"font-line", "-h"
  end
end
