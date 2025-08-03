# [O] Outdated.
class PandocMermaidFilter < Formula
  include Language::Python::Virtualenv
  desc "Pandoc filter for mermaid code blocks"
  homepage "https://github.com/timofurrer/pandoc-mermaid-filter/"
  url "https://files.pythonhosted.org/packages/bc/99/27b5e980963c678c0fc2be4bbfe699aede864b7f4da14bd72d3b84b8a75c/pandoc-mermaid-filter-0.1.0.tar.gz"
  sha256 "ad475b77e5b7506a0d68011af89fc6103ef2044fe0e4379249c4f6a0628ccff1"
  license "MIT"
  head "https://github.com/timofurrer/pandoc-mermaid-filter.git", branch: "master"

  depends_on "python@3.13"

  resource "pandocfilters" do
    url "https://files.pythonhosted.org/packages/70/6f/3dd4940bbe001c06a65f88e36bad298bc7a0de5036115639926b0c5c0458/pandocfilters-1.5.1.tar.gz"
    sha256 "002b4a555ee4ebc03f8b66307e287fa492e4a77b4ea14d3f934328297bb4939e"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"pandoc-mermaid"
  end
end
