class FontV < Formula
  include Language::Python::Virtualenv

  desc "PFont version string reporting and modification library + executable tool"
  homepage "https://github.com/source-foundry/font-v/"
  url "https://files.pythonhosted.org/packages/e3/eb/d115b3d5f591873edce287409d3206db897dc665ffa97277eb90ad6f14e8/font-v-2.1.0.tar.gz"
  sha256 "5c7dca0604a7ddf04633502c792364f3e1027d8fce4e44ffb8014ae38466bdd0"
  head "https://github.com/source-foundry/font-v.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "af02a78f7f0d6eff428ac4121be754f94c6b17050bc8ca3339cf448780ac216b"
  end

  depends_on "fonttools"
  depends_on "python@3.14"

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/5a/96/686339e0fda8142b7ebed39af53f4a5694602a729662f42a6209e3be91d0/fonttools-4.62.0.tar.gz"
    sha256 "0dc477c12b8076b4eb9af2e440421b0433ffa9e1dcb39e0640a6c94665ed1098"
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
    url "https://files.pythonhosted.org/packages/1f/ea/49c993d6dfdd7338c9b1000a0f36817ed7ec84577ae2e52f890d1a4ff909/smmap-5.0.3.tar.gz"
    sha256 "4d9debb8b99007ae47165abc08670bd74cb74b5227dda7f643eccc4e9eb5642c"
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
