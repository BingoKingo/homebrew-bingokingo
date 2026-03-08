class PythonCreole < Formula
  include Language::Python::Virtualenv

  desc "Creole markup tools written in Python"
  homepage "https://github.com/jedie/python-creole/"
  url "https://files.pythonhosted.org/packages/bc/39/44c669eaa88c5ce284e27e1b915a13b190b0f0cfdc320a30c868f9542de3/python-creole-1.4.10.tar.gz"
  sha256 "6429aedc7cef578fe681d7781ad12dbea6ee54e03937b0e1b697e4cae5ff80bb"
  license "GPL-3.0-or-later"
  head "https://github.com/jedie/python-creole.git", branch: "main"

  depends_on "docutils"
  depends_on "python@3.13"

  resource "docutils" do
    url "https://files.pythonhosted.org/packages/ae/b6/03bb70946330e88ffec97aefd3ea75ba575cb2e762061e0e62a213befee8/docutils-0.22.4.tar.gz"
    sha256 "4db53b1fde9abecbb74d91230d32ab626d94f6badfc575d6db9194a49df29968"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"html2creole", "--help"
  end
end
