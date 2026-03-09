class Ufolint < Formula
  include Language::Python::Virtualenv

  desc "UFO source format linter"
  homepage "https://github.com/source-foundry/ufolint/"
  url "https://files.pythonhosted.org/packages/9e/22/1dd70f9be173482352dc9c3555af04bc5db19874b9568b360060fe492ff8/ufolint-1.2.0.tar.gz"
  sha256 "5578c2a17949b33e9a9d2d069849f7a83ca82b5f0a3d35bef8d24668be95bbe7"
  head "https://github.com/source-foundry/ufolint.git", branch: "master"

  depends_on "fonttools"
  depends_on "python@3.14"

  resource "commandlines" do
    url "https://files.pythonhosted.org/packages/b9/4c/d380f7f9aaa12175b189cfe087e823cd9aa2a99afc95a8d6e028142311c9/commandlines-0.4.1.tar.gz"
    sha256 "86b650b78470ac95966d7b1a9d215c16591bccb34b28ae2bb9026c3b4166fd64"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/ec/ca/cf17b88a8df95691275a3d77dc0a5ad9907f328ae53acbe6795da1b2f5ed/fonttools-4.61.1.tar.gz"
    sha256 "6675329885c44657f826ef01d9e4fb33b9158e9d93c537d84ad8399539bc6f69"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/ufolint -h")
    assert_match "Copyright 2019 Source Foundry Authors", output
    assert_match "ufolint is a UFO source file linter.", output
    assert_match "Usage", output
    version_output = shell_output("#{bin}/ufolint -v")
    assert_match "ufolint v#{version}", version_output
  end
end
