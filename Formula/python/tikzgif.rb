class Tikzgif < Formula
  include Language::Python::Virtualenv

  desc "Convert parameterized TikZ/LaTeX files into animated GIFs"
  homepage "https://github.com/j-vaught/tikzgif"
  url "https://github.com/j-vaught/tikzgif/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9fc6f99052b3127873d60ca9b8573e7e6705ff287e9b2f82597063e2e028d657"
  license "MIT"
  head "https://github.com/j-vaught/tikzgif.git", branch: "main"

  depends_on "pillow"
  depends_on "python@3.14"

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/1f/42/5c74462b4fd957fcd7b13b04fb3205ff8349236ea74c7c375766d6c82288/pillow-12.1.1.tar.gz"
    sha256 "9ad8fa5937ab05218e2b6a4cff30295ad35afd2f83ac592e68c0d871bb0fdbc4"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/09/a9/6ba95a270c6f1fbcd8dac228323f2777d886cb206987444e4bce66338dd4/tqdm-4.67.3.tar.gz"
    sha256 "7d825f03f89244ef73f1d4ce193cb1774a8179fd96f31d7e1dcde62092b960bb"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "false"
  end
end
