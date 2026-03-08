class FfmpegProgressYield < Formula
  include Language::Python::Virtualenv

  desc "Prefix ffmpeg command with progress"
  homepage "https://github.com/slhck/ffmpeg-progress-yield/"
  url "https://github.com/slhck/ffmpeg-progress-yield/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "bf4edb8ab4069296beea08e79b721e72c8018587eb78771bac014586bb957bc9"
  license "MIT"
  head "https://github.com/slhck/ffmpeg-progress-yield.git", branch: "master"

  depends_on "python-setuptools" => :build
  depends_on "ffmpeg"
  depends_on "python@3.14"

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/09/a9/6ba95a270c6f1fbcd8dac228323f2777d886cb206987444e4bce66338dd4/tqdm-4.67.3.tar.gz"
    sha256 "7d825f03f89244ef73f1d4ce193cb1774a8179fd96f31d7e1dcde62092b960bb"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/ffmpeg-progress-yield -h")
    assert_match "usage", output
    assert_match "ffmpeg-progress-yield v#{version}", output
    assert_match "positional arguments", output
    assert_match "options", output
  end
end
