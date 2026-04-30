class Tikzgif < Formula
  include Language::Python::Virtualenv

  desc "Convert parameterized TikZ/LaTeX files into animated GIFs"
  homepage "https://github.com/j-vaught/tikzgif"
  url "https://github.com/j-vaught/tikzgif/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9fc6f99052b3127873d60ca9b8573e7e6705ff287e9b2f82597063e2e028d657"
  license "MIT"
  head "https://github.com/j-vaught/tikzgif.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "dd536403149043cf1253b15c6813ac76556ce927d2ad0430834e04a31eec6871"
  end

  depends_on "pillow"
  depends_on "python@3.14"

  pypi_packages extra_packages: %w[pillow]

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/09/a9/6ba95a270c6f1fbcd8dac228323f2777d886cb206987444e4bce66338dd4/tqdm-4.67.3.tar.gz"
    sha256 "7d825f03f89244ef73f1d4ce193cb1774a8179fd96f31d7e1dcde62092b960bb"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/tikzgif -h")
    assert_match "Parameterized TikZ to animation pipeline", output
    assert_match "positional arguments", output
    assert_match "options", output
    version_output = shell_output("#{bin}/tikzgif --version")
    assert_match "tikzgif #{version}", version_output
  end
end
