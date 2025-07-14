class Tqdm < Formula
  include Language::Python::Virtualenv
  desc "Fast, Extensible Progress Bar for Python and CLI"
  homepage "https://github.com/tqdm/tqdm/"
  url "https://files.pythonhosted.org/packages/a8/4b/29b4ef32e036bb34e4ab51796dd745cdba7ed47ad142a9f4a1eb8e0c744d/tqdm-4.67.1.tar.gz"
  sha256 "f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2"
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
