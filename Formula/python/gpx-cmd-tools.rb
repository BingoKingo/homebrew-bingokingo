class GpxCmdTools < Formula
  include Language::Python::Virtualenv
  desc "Command-line tools for GPX"
  homepage "https://github.com/tkrajina/gpx-cmd-tools/"
  url "https://files.pythonhosted.org/packages/8f/53/ed7b5dfe430f55c75bbe805baaf8f275e458cc5f3907f36084ac2aeb58fa/gpx-cmd-tools-0.0.1.tar.gz"
  sha256 "0ddc2f3c9b41e775ca09b9d5ee9b4411d48dcd13370d5d92ba2bb528979e6c9c"
  license "Apache-2.0"
  head "https://github.com/tkrajina/gpx-cmd-tools.git", branch: "master"

  depends_on "python@3.13"

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
    system "gpxsimplify", "-h"
  end
end
