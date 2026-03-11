class Shtab < Formula
  include Language::Python::Virtualenv

  desc "Automagic shell tab completion for Python CLI applications"
  homepage "https://github.com/iterative/shtab/"
  url "https://files.pythonhosted.org/packages/b0/7a/7f131b6082d8b592c32e4312d0a6da3d0b28b8f0d305ddd93e49c9d89929/shtab-1.8.0.tar.gz"
  sha256 "75f16d42178882b7f7126a0c2cb3c848daed2f4f5a276dd1ded75921cc4d073a"
  license "Apache-2.0"
  head "https://github.com/iterative/shtab.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "d18c26864b16439c814fb4e0f1ef46bf3941fbc0fb44c9a6773b6322dd2e234f"
  end

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/shtab -h")
    assert_match "usage", output
    assert_match "positional arguments", output
    assert_match "options", output
    version_output = shell_output("#{bin}/shtab --version")
    assert_match "shtab #{version}", version_output
  end
end
