class Tqdm < Formula
  include Language::Python::Virtualenv

  desc "Fast, Extensible Progress Bar for Python and CLI"
  homepage "https://github.com/tqdm/tqdm/"
  url "https://files.pythonhosted.org/packages/09/a9/6ba95a270c6f1fbcd8dac228323f2777d886cb206987444e4bce66338dd4/tqdm-4.67.3.tar.gz"
  sha256 "7d825f03f89244ef73f1d4ce193cb1774a8179fd96f31d7e1dcde62092b960bb"
  license all_of: ["MIT", "MPL-2.0"]
  head "https://github.com/tqdm/tqdm.git", branch: "master"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"tqdm", "--help"
  end
end
