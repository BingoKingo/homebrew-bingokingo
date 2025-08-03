class Autosubsync < Formula
  include Language::Python::Virtualenv
  desc "Human friendly output for text interfaces using Python"
  homepage "https://github.com/oseiskar/autosubsync/"
  url "https://github.com/oseiskar/autosubsync/archive/refs/tags/1.0.1.tar.gz"
  sha256 "d2eff0b327b53d4c5a522c607337f068b7ab8518ea7fdc4231eb4ad9c5b13e9a"
  license "MIT"
  head "https://github.com/oseiskar/autosubsync.git", branch: "master"

  depends_on "cffi"
  depends_on "numpy"
  depends_on "pycparser"
  depends_on "python@3.13"

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/fc/97/c783634659c2920c3fc70419e3af40972dbaf758daa229a7d6ea6135c90d/cffi-1.17.1.tar.gz"
    sha256 "1c39c6016c32bc48dd54561950ebd6836e1670f2ae46128f67cf49e789c52824"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/2e/19/d7c972dfe90a353dbd3efbbe1d14a5951de80c99c9dc1b93cd998d51dc0f/numpy-2.3.1.tar.gz"
    sha256 "1ec9ae20a4226da374362cca3c62cd753faf2f951440b0e3b98e93c235441d2b"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/1d/b2/31537cf4b1ca988837256c910a668b553fceb8f069bedc4b1c826024b52c/pycparser-2.22.tar.gz"
    sha256 "491c8be9c040f5390f5bf44a5b07752bd07f56edf992381b05c701439eec10f6"
  end

  resource "pysoundfile" do
    url "https://files.pythonhosted.org/packages/07/fa/bbe4d1c4328eaa83c0656c729eabbf811377fc1e8416d42bf7f7af63ef8c/PySoundFile-0.9.0.post1.tar.gz"
    sha256 "43dd46a2afc0484c26930a7e59eef9365cee81bce7a4aadc5699f788f60d32c3"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"autosubsync", "-h"
  end
end
