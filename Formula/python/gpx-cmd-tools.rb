class GpxCmdTools < Formula
  include Language::Python::Virtualenv

  desc "Command-line tools for GPX"
  homepage "https://github.com/tkrajina/gpx-cmd-tools/"
  url "https://files.pythonhosted.org/packages/8f/53/ed7b5dfe430f55c75bbe805baaf8f275e458cc5f3907f36084ac2aeb58fa/gpx-cmd-tools-0.0.1.tar.gz"
  sha256 "0ddc2f3c9b41e775ca09b9d5ee9b4411d48dcd13370d5d92ba2bb528979e6c9c"
  license "Apache-2.0"
  head "https://github.com/tkrajina/gpx-cmd-tools.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "2a587c37170163c9d590b8dfdf497d65eb337ee7b03783cefba4a117bc097eb7"
  end

  depends_on "python@3.14"

  resource "gpxpy" do
    url "https://files.pythonhosted.org/packages/20/ad/6f1a34e702c72cb495bb258396f237ded76c00f9fe67054a44d778d24ed9/gpxpy-1.6.2.tar.gz"
    sha256 "a72c484b97ec42b80834353b029cc8ee1b79f0ffca1179b2210bb3baf26c01ae"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      `gpx-info` is not available.
    EOS
  end

  test do
    output = shell_output("#{bin}/gpxsimplify -h")
    assert_match "usage", output
    assert_match "Simplify tracks using the Ramer-Douglas-Peucker algorithm", output
    assert_match "positional arguments", output
    assert_match "options", output
  end
end
