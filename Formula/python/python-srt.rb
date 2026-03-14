class PythonSrt < Formula
  include Language::Python::Virtualenv

  desc "Parsing, modifying, and composing SRT files"
  homepage "https://github.com/cdown/srt/"
  url "https://files.pythonhosted.org/packages/66/b7/4a1bc231e0681ebf339337b0cd05b91dc6a0d701fa852bb812e244b7a030/srt-3.5.3.tar.gz"
  sha256 "4884315043a4f0740fd1f878ed6caa376ac06d70e135f306a6dc44632eed0cc0"
  license "MIT"
  head "https://github.com/cdown/srt.git", branch: "develop"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"srt", "--help"
  end
end
