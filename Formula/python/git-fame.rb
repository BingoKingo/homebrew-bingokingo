class GitFame < Formula
  include Language::Python::Virtualenv
  desc "Pretty-print git repository collaborators sorted by contributions"
  homepage "https://github.com/casperdcl/git-fame/"
  url "https://files.pythonhosted.org/packages/62/3e/6917394fb60a90847d6686ae18dc76fff6e8f98ea501e2768dcbd4d1d8ed/git_fame-2.0.2.tar.gz"
  sha256 "be72b64af451d887099339848fe310e686f2bd472bbde7e4fc338825c364bf2d"
  license "MPL-2.0"
  head "https://github.com/casperdcl/git-fame.git", branch: "main"

  depends_on "git"
  # depends_on "python-tabulate"
  depends_on "python@3.13"

  resource "argopt" do
    url "https://files.pythonhosted.org/packages/88/1e/4dd20f0ad39f81dd815b6fa4fea53be370d2ca0eeef9f8dc8e05b81c4284/argopt-0.8.2.tar.gz"
    sha256 "fabdb99043a82a320e0c257719f59a677404640dce97b079d2dac9b6b581aeec"
  end

  resource "tabulate" do
    url "https://files.pythonhosted.org/packages/ec/fe/802052aecb21e3797b8f7902564ab6ea0d60ff8ca23952079064155d1ae1/tabulate-0.9.0.tar.gz"
    sha256 "0095b12bf5966de529c0feb1fa08671671b3368eec77d7ef7ab114be2c068b3c"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/a8/4b/29b4ef32e036bb34e4ab51796dd745cdba7ed47ad142a9f4a1eb8e0c744d/tqdm-4.67.1.tar.gz"
    sha256 "f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"git-fame", "-h"
  end
end
