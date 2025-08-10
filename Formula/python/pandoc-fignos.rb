class PandocFignos < Formula
  include Language::Python::Virtualenv
  desc "Pandoc filter for numbering figures and figure references"
  homepage "https://github.com/tomduck/pandoc-fignos/"
  url "https://files.pythonhosted.org/packages/b5/ca/7fbf5c28111e0c1d8793e0579544314e7ce13292cd99105ecd662bd7dd6b/pandoc-fignos-2.4.0.tar.gz"
  sha256 "7058edeae48824412e9fe090dd5f72500a9ef7d33a40391826b17338397d8849"
  license "GPL-3.0-or-later"
  head "https://github.com/tomduck/pandoc-fignos.git", branch: "master"
  deprecate! date: "2020-11-11", because: :unmaintained
  depends_on "python@3.13"

  resource "pandoc-xnos" do
    url "https://files.pythonhosted.org/packages/f8/67/2f775963c0959f43821c4242e66143d42f39a01ac8e0c17f7d67ed126df7/pandoc-xnos-2.5.0.tar.gz"
    sha256 "7c18738c899e4ecec573dc6565abd8d43281fc894d41b82743d51df3dde250ae"
  end

  resource "pandocfilters" do
    url "https://files.pythonhosted.org/packages/70/6f/3dd4940bbe001c06a65f88e36bad298bc7a0de5036115639926b0c5c0458/pandocfilters-1.5.1.tar.gz"
    sha256 "002b4a555ee4ebc03f8b66307e287fa492e4a77b4ea14d3f934328297bb4939e"
  end

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/90/c7/6dc0a455d111f68ee43f27793971cf03fe29b6ef972042549db29eec39a2/psutil-5.9.8.tar.gz"
    sha256 "6be126e3225486dff286a8fb9a06246a5253f4c7c53b475ea5f5ac934e64194c"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"pandoc-fignos", "-h"
  end
end
