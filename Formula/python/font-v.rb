class FontV < Formula
  include Language::Python::Virtualenv

  desc "PFont version string reporting and modification library + executable tool"
  homepage "https://github.com/source-foundry/font-v/"
  url "https://files.pythonhosted.org/packages/e3/eb/d115b3d5f591873edce287409d3206db897dc665ffa97277eb90ad6f14e8/font-v-2.1.0.tar.gz"
  sha256 "5c7dca0604a7ddf04633502c792364f3e1027d8fce4e44ffb8014ae38466bdd0"
  head "https://github.com/source-foundry/font-v.git", branch: "master"

  depends_on "fonttools"
  depends_on "python@3.14"

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/ec/ca/cf17b88a8df95691275a3d77dc0a5ad9907f328ae53acbe6795da1b2f5ed/fonttools-4.61.1.tar.gz"
    sha256 "6675329885c44657f826ef01d9e4fb33b9158e9d93c537d84ad8399539bc6f69"
  end

  resource "gitdb" do
    url "https://files.pythonhosted.org/packages/72/94/63b0fc47eb32792c7ba1fe1b694daec9a63620db1e313033d18140c2320a/gitdb-4.0.12.tar.gz"
    sha256 "5ef71f855d191a3326fcfbc0d5da835f26b13fbcba60c32c21091c349ffdb571"
  end

  resource "gitpython" do
    url "https://files.pythonhosted.org/packages/df/b5/59d16470a1f0dfe8c793f9ef56fd3826093fc52b3bd96d6b9d6c26c7e27b/gitpython-3.1.46.tar.gz"
    sha256 "400124c7d0ef4ea03f7310ac2fbf7151e09ff97f2a3288d64a440c584a29c37f"
  end

  resource "smmap" do
    url "https://files.pythonhosted.org/packages/44/cd/a040c4b3119bbe532e5b0732286f805445375489fceaec1f48306068ee3b/smmap-5.0.2.tar.gz"
    sha256 "26ea65a03958fa0c8a1c7e8c7a58fdc77221b8910f6be2131affade476898ad5"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/font-v -h")
    assert_match "Copyright 2018 Christopher Simpkins", output
    assert_match "USAGE", output
    assert_match "Subcommands and options", output
    assert_match "NOTES", output
  end
end
