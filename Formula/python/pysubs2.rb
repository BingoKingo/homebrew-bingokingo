class Pysubs2 < Formula
  include Language::Python::Virtualenv

  desc "Library for editing subtitle files"
  homepage "https://github.com/tkarabela/pysubs2/"
  url "https://files.pythonhosted.org/packages/31/4a/becf78d9d3df56e6c4a9c50b83794e5436b6c5ab6dd8a3f934e94c89338c/pysubs2-1.8.0.tar.gz"
  sha256 "3397bb58a4a15b1325ba2ae3fd4d7c214e2c0ddb9f33190d6280d783bb433b20"
  license "MIT"
  head "https://github.com/tkarabela/pysubs2.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "16d6d2776a7003a4cb0b76d0f059560bd8082c40dfeae2b1002f23836bca9f3e"
  end

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/pysubs2 -h")
    assert_match "The pysubs2 CLI for processing subtitle files.", output
    assert_match "positional arguments", output
    assert_match "options", output
    assert_match "optional arguments", output
    assert_match "usage examples", output
    version_output = shell_output("#{bin}/pysubs2 -v").strip
    assert_match "pysubs2 #{version}", version_output
  end
end
