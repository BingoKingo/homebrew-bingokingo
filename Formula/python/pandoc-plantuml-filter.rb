class PandocPlantumlFilter < Formula
  include Language::Python::Virtualenv
  desc "Pandoc filter for plantUML code blocks"
  homepage "https://github.com/timofurrer/pandoc-plantuml-filter/"
  url "https://files.pythonhosted.org/packages/be/e2/e48d2c5053e566f89076a0d650d44ff8a1132701100da054c32fc557ee0d/pandoc-plantuml-filter-0.1.5.tar.gz"
  sha256 "f6a5de219b82bb8e26f44a0f08f2fb32011ba04c0df753b294b7db9308646584"
  license "MIT"
  head "https://github.com/timofurrer/pandoc-plantuml-filter.git", branch: "master"

  depends_on "python@3.13"

  resource "pandocfilters" do
    url "https://files.pythonhosted.org/packages/70/6f/3dd4940bbe001c06a65f88e36bad298bc7a0de5036115639926b0c5c0458/pandocfilters-1.5.1.tar.gz"
    sha256 "002b4a555ee4ebc03f8b66307e287fa492e4a77b4ea14d3f934328297bb4939e"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"pandoc-plantuml"
  end
end
