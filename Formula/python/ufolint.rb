class Ufolint < Formula
  include Language::Python::Virtualenv
  desc "UFO source format linter"
  homepage "https://github.com/source-foundry/ufolint/"
  url "https://files.pythonhosted.org/packages/9e/22/1dd70f9be173482352dc9c3555af04bc5db19874b9568b360060fe492ff8/ufolint-1.2.0.tar.gz"
  sha256 "5578c2a17949b33e9a9d2d069849f7a83ca82b5f0a3d35bef8d24668be95bbe7"
  head "https://github.com/source-foundry/ufolint.git", branch: "master"

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

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"ufolint", "-h"
  end
end
