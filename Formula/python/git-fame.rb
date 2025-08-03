class GitFame < Formula
  include Language::Python::Virtualenv
  desc "Pretty-print git repository collaborators sorted by contributions"
  homepage "https://github.com/casperdcl/git-fame/"
  url "https://files.pythonhosted.org/packages/25/ab/ad71516d849d1b6160834b15c00590b9e83ba9f3b1f13c2f2ba43a86a81f/git_fame-3.1.1.tar.gz"
  sha256 "b35500117943a138265cd826ab07c50aa65f3c7bb9d54ced12c5e2932ce0ad22"
  license "MPL-2.0"
  head "https://github.com/casperdcl/git-fame.git", branch: "main"

  depends_on "git"
  depends_on "python-tabulate"
  depends_on "python@3.13"

  resource "argopt" do
    url "https://files.pythonhosted.org/packages/a3/8c/f1dbbb7ca1b6bdfebd8b3ae1d44f099c5678a1592f1562547037e76330d4/argopt-0.9.1.tar.gz"
    sha256 "29780679f4ff620ffbc897c74415bf99a80fb61c26afdb10fe7aac887efb770e"
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
