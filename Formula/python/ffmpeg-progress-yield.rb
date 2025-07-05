class FfmpegProgressYield < Formula
  include Language::Python::Virtualenv
  desc "Prefix ffmpeg command with progress"
  homepage "https://github.com/slhck/ffmpeg-progress-yield/"
  url "https://files.pythonhosted.org/packages/f3/e2/cf0f04e3e140d7c1ce7b7de42593b86fdcce4af2c9b05aad902e7fcc16a4/ffmpeg_progress_yield-0.11.3.tar.gz"
  sha256 "eb266419fee1df929780bc57cf9b52db086b48fd2e82b20703a64d4bf5a67592"
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
