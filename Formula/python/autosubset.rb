class Autosubset < Formula
  include Language::Python::Virtualenv

  desc "Automatic font subsetting for a provided text"
  homepage "https://gitlab.com/MarcelWaldvogel/autosubset/"
  url "https://files.pythonhosted.org/packages/5e/9a/cbef31056f9a562d40e4c75086fb08ce5486f8106e5ebf923d7cebdb113c/autosubset-0.3.0.tar.gz"
  sha256 "aa36d9f95dc22279db201259bfc26c4840d3764b2cd7870ddad6b0c6829a64fd"
  license "MIT"
  head "https://gitlab.com/MarcelWaldvogel/autosubset.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "e91af5862dd2d8558e7e61288b7351f5987a2030acfa182c4bab827e504bc027"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9073d90001fc1319c753af1737b07384c07fa87d5560f4830657ceeaf729f614"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "75546d3fd9b27d6104ddc5629f452b3c88ad434851deb562282de8e9732d2d20"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "d26ed4bf186456c3cd396545a90f19def4f9b94dd0b618e9a6ce5d1f4c595c29"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a25145e127fa1c41ac0e53088be4236211fe0363173c0095baa5d60b814581dd"
  end

  depends_on "brotli"
  depends_on "fonttools"
  depends_on "python@3.13"

  resource "brotli" do
    url "https://files.pythonhosted.org/packages/2f/c2/f9e977608bdf958650638c3f1e28f85a1b075f075ebbe77db8555463787b/Brotli-1.1.0.tar.gz"
    sha256 "81de08ac11bcb85841e440c13611c00b67d3bf82698314928d0b676362546724"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/8a/27/ec3c723bfdf86f34c5c82bf6305df3e0f0d8ea798d2d3a7cb0c0a866d286/fonttools-4.59.0.tar.gz"
    sha256 "be392ec3529e2f57faa28709d60723a763904f71a2b63aabe14fee6648fe3b14"
  end

  resource "zopfli" do
    url "https://files.pythonhosted.org/packages/5e/7c/a8f6696e694709e2abcbccd27d05ef761e9b6efae217e11d977471555b62/zopfli-0.2.3.post1.tar.gz"
    sha256 "96484dc0f48be1c5d7ae9f38ed1ce41e3675fd506b27c11a6607f14b49101e99"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"autosubset", "-h"
  end
end
