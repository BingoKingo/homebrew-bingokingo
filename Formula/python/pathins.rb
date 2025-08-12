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
  depends_on "python@3.13"

  resource "cython" do
    url "https://files.pythonhosted.org/packages/18/40/7b17cd866158238db704965da1b5849af261dbad393ea3ac966f934b2d39/cython-3.1.2.tar.gz"
    sha256 "6bbf7a953fa6762dfecdec015e3b054ba51c0121a45ad851fa130f63f5331381"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/8a/27/ec3c723bfdf86f34c5c82bf6305df3e0f0d8ea798d2d3a7cb0c0a866d286/fonttools-4.59.0.tar.gz"
    sha256 "be392ec3529e2f57faa28709d60723a763904f71a2b63aabe14fee6648fe3b14"
  end

  resource "skia-pathops" do
    url "https://files.pythonhosted.org/packages/e5/85/4c6ce1f1f3e8d3888165f2830adcf340922416c155647b12ebac2dcc423e/skia_pathops-0.8.0.post2.zip"
    sha256 "9e252cdeb6c4d162e82986d31dbd89c675d1677cb8019c2e13e6295d4a557269"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"pathins", "-h"
  end
end
