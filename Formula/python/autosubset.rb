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
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "5be23150b76607d418f2dd1ce3a5c032fd3d39b1f292bdec8c9680d579cb9570"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "533449ff17efc90ab9a5a7d262ee1fb11b85ca02ff1c99bafad1b6b674db0940"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "697e7fa94a4861c6653b631b9dcd9d8f70fbf0726cfd9239f4bf98ff0e318ab5"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "85e1cefb76d956cda7abd8e08242f7b733c76739cc662aed3279e578e0e2ad5a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e407d006280b656f3e44ad20291a5481891f0ba3695c4eaf198fb2dc80f24498"
  end

  depends_on "brotli"
  depends_on "fonttools"
  depends_on "python@3.14"

  resource "brotli" do
    url "https://files.pythonhosted.org/packages/f7/16/c92ca344d646e71a43b8bb353f0a6490d7f6e06210f8554c8f874e454285/brotli-1.2.0.tar.gz"
    sha256 "e310f77e41941c13340a95976fe66a8a95b01e783d430eeaf7a2f87e0a57dd0a"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/5a/96/686339e0fda8142b7ebed39af53f4a5694602a729662f42a6209e3be91d0/fonttools-4.62.0.tar.gz"
    sha256 "0dc477c12b8076b4eb9af2e440421b0433ffa9e1dcb39e0640a6c94665ed1098"
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
