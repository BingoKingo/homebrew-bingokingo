class Shtab < Formula
  include Language::Python::Virtualenv

  desc "Automagic shell tab completion for Python CLI applications"
  homepage "https://github.com/iterative/shtab/"
  url "https://files.pythonhosted.org/packages/b0/7a/7f131b6082d8b592c32e4312d0a6da3d0b28b8f0d305ddd93e49c9d89929/shtab-1.8.0.tar.gz"
  sha256 "75f16d42178882b7f7126a0c2cb3c848daed2f4f5a276dd1ded75921cc4d073a"
  license "Apache-2.0"
  head "https://github.com/iterative/shtab.git", branch: "main"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"shtab", "-h"
  end
end
