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
  depends_on "python@3.14"

  resource "brotli" do
    url "https://files.pythonhosted.org/packages/f7/16/c92ca344d646e71a43b8bb353f0a6490d7f6e06210f8554c8f874e454285/brotli-1.2.0.tar.gz"
    sha256 "e310f77e41941c13340a95976fe66a8a95b01e783d430eeaf7a2f87e0a57dd0a"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/ec/ca/cf17b88a8df95691275a3d77dc0a5ad9907f328ae53acbe6795da1b2f5ed/fonttools-4.61.1.tar.gz"
    sha256 "6675329885c44657f826ef01d9e4fb33b9158e9d93c537d84ad8399539bc6f69"
  end

  resource "zopfli" do
    url "https://files.pythonhosted.org/packages/0a/4d/a8cc1768b2eda3c0c7470bf8059dcb94ef96d45dd91fc6edd29430d44072/zopfli-0.4.1.tar.gz"
    sha256 "07a5cdc5d1aaa6c288c5d9f5a5383042ba743641abf8e2fd898dcad622d8a38e"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/autosubset -h")
    assert_match "usage", output
    assert_match "positional arguments", output
    assert_match "options", output
    version_output = shell_output("#{bin}/autosubset --version")
    assert_match version.to_s, version_output
  end
end
