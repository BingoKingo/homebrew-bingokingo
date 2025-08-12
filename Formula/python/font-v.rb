class FontV < Formula
  include Language::Python::Virtualenv
  desc "PFont version string reporting and modification library + executable tool"
  homepage "https://github.com/source-foundry/font-v/"
  url "https://files.pythonhosted.org/packages/e3/eb/d115b3d5f591873edce287409d3206db897dc665ffa97277eb90ad6f14e8/font-v-2.1.0.tar.gz"
  sha256 "5c7dca0604a7ddf04633502c792364f3e1027d8fce4e44ffb8014ae38466bdd0"
  head "https://github.com/source-foundry/font-v.git", branch: "master"

  depends_on "fonttools"
  depends_on "python@3.13"

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/8a/27/ec3c723bfdf86f34c5c82bf6305df3e0f0d8ea798d2d3a7cb0c0a866d286/fonttools-4.59.0.tar.gz"
    sha256 "be392ec3529e2f57faa28709d60723a763904f71a2b63aabe14fee6648fe3b14"
  end

  resource "gitdb" do
    url "https://files.pythonhosted.org/packages/72/94/63b0fc47eb32792c7ba1fe1b694daec9a63620db1e313033d18140c2320a/gitdb-4.0.12.tar.gz"
    sha256 "5ef71f855d191a3326fcfbc0d5da835f26b13fbcba60c32c21091c349ffdb571"
  end

  resource "gitpython" do
    url "https://files.pythonhosted.org/packages/9a/c8/dd58967d119baab745caec2f9d853297cec1989ec1d63f677d3880632b88/gitpython-3.1.45.tar.gz"
    sha256 "85b0ee964ceddf211c41b9f27a49086010a190fd8132a24e21f362a4b36a791c"
  end

  resource "smmap" do
    url "https://files.pythonhosted.org/packages/44/cd/a040c4b3119bbe532e5b0732286f805445375489fceaec1f48306068ee3b/smmap-5.0.2.tar.gz"
    sha256 "26ea65a03958fa0c8a1c7e8c7a58fdc77221b8910f6be2131affade476898ad5"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"font-v", "-h"
  end
end
