class Pathins < Formula
  include Language::Python::Virtualenv

  desc "Quadratic font curve path inspector"
  homepage "https://github.com/source-foundry/path-inspector/"
  url "https://files.pythonhosted.org/packages/56/8a/2c1abc0a7fb196dfa1cc4499a0e8702a7204dec95c3b5f6855a28217cd87/pathins-0.5.4.tar.gz"
  sha256 "4563a2b15c566a880834f2a39aabc941fbce80dbeaf79b526f29b472dd0146bf"
  license "Apache-2.0"
  head "https://github.com/source-foundry/path-inspector.git", branch: "master"

  depends_on "cython"
  depends_on "fonttools"
  depends_on "python@3.14"

  resource "cython" do
    url "https://files.pythonhosted.org/packages/91/85/7574c9cd44b69a27210444b6650f6477f56c75fee1b70d7672d3e4166167/cython-3.2.4.tar.gz"
    sha256 "84226ecd313b233da27dc2eb3601b4f222b8209c3a7216d8733b031da1dc64e6"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/ec/ca/cf17b88a8df95691275a3d77dc0a5ad9907f328ae53acbe6795da1b2f5ed/fonttools-4.61.1.tar.gz"
    sha256 "6675329885c44657f826ef01d9e4fb33b9158e9d93c537d84ad8399539bc6f69"
  end

  resource "skia-pathops" do
    url "https://files.pythonhosted.org/packages/4a/f6/ab37d6fa21f25965d4ad059745c76f13ddfb92a2c06a842a42ad77961c24/skia_pathops-0.9.2.tar.gz"
    sha256 "4b6d8459f6f4a69282cb26fca0c2bb0b321cc58a9bf9cc6579a52a391edc0319"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/pathins -h")
    assert_match "usage", output
    assert_match "Quadratic font curve path inspector", output
    assert_match "positional arguments", output
    assert_match "options", output
    version_output = shell_output("#{bin}/pathins -v")
    assert_match "pathins v#{version}", version_output
  end
end
