class FfmpegProgressYield < Formula
  include Language::Python::Virtualenv
  desc "Prefix ffmpeg command with progress"
  homepage "https://github.com/slhck/ffmpeg-progress-yield/"
  url "https://github.com/slhck/ffmpeg-progress-yield/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "6ac310f16c7ec6bafdc7b740f7b613710380c201d8c94b060e60a0be1a4743f4"
  license "MIT"
  head "https://github.com/slhck/ffmpeg-progress-yield.git", branch: "master"

  depends_on "ffmpeg"
  depends_on "python-setuptools"
  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"ffmpeg-progress-yield", "-h"
  end
end
