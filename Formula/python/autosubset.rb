class Autosubset < Formula
  include Language::Python::Virtualenv

  desc "Automatic font subsetting for a provided text"
  homepage "https://gitlab.com/MarcelWaldvogel/autosubset/"
  url "https://files.pythonhosted.org/packages/5e/9a/cbef31056f9a562d40e4c75086fb08ce5486f8106e5ebf923d7cebdb113c/autosubset-0.3.0.tar.gz"
  sha256 "aa36d9f95dc22279db201259bfc26c4840d3764b2cd7870ddad6b0c6829a64fd"
  license "MIT"
  head "https://gitlab.com/MarcelWaldvogel/autosubset.git", branch: "main"

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
