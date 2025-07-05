class Py7zr < Formula
  include Language::Python::Virtualenv
  desc "Pure python 7-zip library"
  homepage "https://py7zr.readthedocs.io/"
  url "https://files.pythonhosted.org/packages/26/c3/0e05c711c16af0b9c47f3f77323303b338b9a871ba020d95d2b8dd6605ae/py7zr-0.22.0.tar.gz"
  sha256 "c6c7aea5913535184003b73938490f9a4d8418598e533f9ca991d3b8e45a139e"
  license "LGPL-2.1"
  head "https://github.com/miurahr/py7zr.git", branch: "master"

  depends_on "brotli"
  depends_on "python@3.13"

  resource "inflate64" do
    url "https://files.pythonhosted.org/packages/dd/8c/3a7ac7e1931bd1bca5f8e3687f7611083f6a79aae02b9cd6b7ce1fb4a8d0/inflate64-1.0.1.tar.gz"
    sha256 "3b1c83c22651b5942b35829df526e89602e494192bf021e0d7d0b600e76c429d"
  end

  resource "multivolumefile" do
    url "https://files.pythonhosted.org/packages/50/f0/a7786212b5a4cb9ba05ae84a2bbd11d1d0279523aea0424b6d981d652a14/multivolumefile-0.2.3.tar.gz"
    sha256 "a0648d0aafbc96e59198d5c17e9acad7eb531abea51035d08ce8060dcad709d6"
  end

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/1f/5a/07871137bb752428aa4b659f910b399ba6f291156bdea939be3e96cae7cb/psutil-6.1.1.tar.gz"
    sha256 "cf8496728c18f2d0b45198f06895be52f36611711746b7f30c464b422b50e2f5"
  end

  resource "pybcj" do
    url "https://files.pythonhosted.org/packages/bf/69/3f4ce9d4c79f6ddf6bf60af873f65605123a0e8cd13159f8531a9cb81710/pybcj-1.0.3.tar.gz"
    sha256 "b8873637f0be00ceaa372d0fb81693604b4bbc8decdb2b1ae5f9b84d196788d9"
  end

  resource "pycryptodomex" do
    url "https://files.pythonhosted.org/packages/11/dc/e66551683ade663b5f07d7b3bc46434bf703491dbd22ee12d1f979ca828f/pycryptodomex-3.21.0.tar.gz"
    sha256 "222d0bd05381dd25c32dd6065c071ebf084212ab79bab4599ba9e6a3e0009e6c"
  end

  resource "pyppmd" do
    url "https://files.pythonhosted.org/packages/42/8e/06581a619ad31cd28fd897bd55aff2ea945d3d566969b8b3f682599e6dee/pyppmd-1.1.1.tar.gz"
    sha256 "f1a812f1e7628f4c26d05de340b91b72165d7b62778c27d322b82ce2e8ff00cb"
  end

  resource "pyzstd" do
    url "https://files.pythonhosted.org/packages/62/14/878fee4072cecb1cc6e061c7d0d933e481389c27de939538c9cc3f18894a/pyzstd-0.16.2.tar.gz"
    sha256 "179c1a2ea1565abf09c5f2fd72f9ce7c54b2764cf7369e05c0bfd8f1f67f63d2"
  end

  resource "texttable" do
    url "https://files.pythonhosted.org/packages/1c/dc/0aff23d6036a4d3bf4f1d8c8204c5c79c4437e25e0ae94ffe4bbb55ee3c2/texttable-1.7.0.tar.gz"
    sha256 "2d2068fb55115807d3ac77a4ca68fa48803e84ebb0ee2340f858107a36522638"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"py7zr", "-h"
  end
end
