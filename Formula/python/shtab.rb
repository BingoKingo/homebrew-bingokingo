class Shtab < Formula
  include Language::Python::Virtualenv
  desc "Automagic shell tab completion for Python CLI applications"
  homepage "https://github.com/iterative/shtab/"
  url "https://files.pythonhosted.org/packages/5a/3e/837067b970c1d2ffa936c72f384a63fdec4e186b74da781e921354a94024/shtab-1.7.2.tar.gz"
  sha256 "8c16673ade76a2d42417f03e57acf239bfb5968e842204c17990cae357d07d6f"
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
