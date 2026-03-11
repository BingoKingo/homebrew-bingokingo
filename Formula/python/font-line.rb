class FontLine < Formula
  include Language::Python::Virtualenv

  desc "OpenType vertical metrics reporting and font line spacing adjustment tool"
  homepage "https://github.com/source-foundry/font-line/"
  url "https://files.pythonhosted.org/packages/52/71/b9defbaad1e61a6795de1b43127fc0925021ad1b77a50f80ea0620f3ffef/font-line-3.1.4.tar.gz"
  sha256 "21d8d64aa833fc237760d8f296e55fc5ad6ff3157db92679f2e91451e9abc8c6"
  head "https://github.com/source-foundry/font-line.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "9a4d7f4b0c773913756ca5869b4d8493684db9d86837324ef613e06fd1838dd7"
  end

  depends_on "fonttools"
  depends_on "python@3.14"

  resource "commandlines" do
    url "https://files.pythonhosted.org/packages/b9/4c/d380f7f9aaa12175b189cfe087e823cd9aa2a99afc95a8d6e028142311c9/commandlines-0.4.1.tar.gz"
    sha256 "86b650b78470ac95966d7b1a9d215c16591bccb34b28ae2bb9026c3b4166fd64"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/5a/96/686339e0fda8142b7ebed39af53f4a5694602a729662f42a6209e3be91d0/fonttools-4.62.0.tar.gz"
    sha256 "0dc477c12b8076b4eb9af2e440421b0433ffa9e1dcb39e0640a6c94665ed1098"
  end

  resource "standardstreams" do
    url "https://files.pythonhosted.org/packages/13/05/69fc5cd9273d842c46fcbfe13b0255aa0341046194b0df64cf94f6861052/standardstreams-0.2.0.tar.gz"
    sha256 "8650d89073af3103db1c65c6706705749f3959286a6246c16cfd51ccbaf12b4b"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/font-line -h")
    assert_match "Copyright 2019 Christopher Simpkins", output
    assert_match "ABOUT", output
    assert_match "SUB-COMMANDS", output
    assert_match "OPTIONS", output
    assert_match "USAGE", output
    version_output = shell_output("#{bin}/font-line -v")
    assert_match "font-line v#{version}", version_output
  end
end
