class GitFame < Formula
  include Language::Python::Virtualenv

  desc "Pretty-print git repository collaborators sorted by contributions"
  homepage "https://github.com/casperdcl/git-fame/"
  url "https://files.pythonhosted.org/packages/25/ab/ad71516d849d1b6160834b15c00590b9e83ba9f3b1f13c2f2ba43a86a81f/git_fame-3.1.1.tar.gz"
  sha256 "b35500117943a138265cd826ab07c50aa65f3c7bb9d54ced12c5e2932ce0ad22"
  license "MPL-2.0"
  head "https://github.com/casperdcl/git-fame.git", branch: "main"

  depends_on "python-tabulate"
  depends_on "python@3.13"

  resource "argopt" do
    url "https://files.pythonhosted.org/packages/a3/8c/f1dbbb7ca1b6bdfebd8b3ae1d44f099c5678a1592f1562547037e76330d4/argopt-0.9.1.tar.gz"
    sha256 "29780679f4ff620ffbc897c74415bf99a80fb61c26afdb10fe7aac887efb770e"
  end

  resource "tabulate" do
    url "https://files.pythonhosted.org/packages/46/58/8c37dea7bbf769b20d58e7ace7e5edfe65b849442b00ffcdd56be88697c6/tabulate-0.10.0.tar.gz"
    sha256 "e2cfde8f79420f6deeffdeda9aaec3b6bc5abce947655d17ac662b126e48a60d"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/09/a9/6ba95a270c6f1fbcd8dac228323f2777d886cb206987444e4bce66338dd4/tqdm-4.67.3.tar.gz"
    sha256 "7d825f03f89244ef73f1d4ce193cb1774a8179fd96f31d7e1dcde62092b960bb"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"git-fame", "-h"
  end
end
