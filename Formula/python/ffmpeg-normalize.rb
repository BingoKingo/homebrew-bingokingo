class FfmpegNormalize < Formula
  include Language::Python::Virtualenv
  desc "Audio Normalization for Python/ffmpeg"
  homepage "https://github.com/slhck/ffmpeg-normalize/"
  url "https://files.pythonhosted.org/packages/f6/7f/ba9076fd5b1090631a6d8ee7e701ef5f480646c933bcfe045c64b7c21162/ffmpeg_normalize-1.31.0.tar.gz"
  sha256 "7d1b1ddc0cf2febe558663b613ceb365b27fbe89f41be35d39894b6267041539"
  license "MIT"
  head "https://github.com/slhck/ffmpeg-normalize.git", branch: "master"

  depends_on "python@3.13"

  resource "colorlog" do
    url "https://files.pythonhosted.org/packages/d3/7a/359f4d5df2353f26172b3cc39ea32daa39af8de522205f512f458923e677/colorlog-6.9.0.tar.gz"
    sha256 "bfba54a1b93b94f54e1f4fe48395725a3d92fd2a4af702f6bd70946bdc0c6ac2"
  end

  resource "ffmpeg-progress-yield" do
    url "https://files.pythonhosted.org/packages/f3/e2/cf0f04e3e140d7c1ce7b7de42593b86fdcce4af2c9b05aad902e7fcc16a4/ffmpeg_progress_yield-0.11.3.tar.gz"
    sha256 "eb266419fee1df929780bc57cf9b52db086b48fd2e82b20703a64d4bf5a67592"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/a8/4b/29b4ef32e036bb34e4ab51796dd745cdba7ed47ad142a9f4a1eb8e0c744d/tqdm-4.67.1.tar.gz"
    sha256 "f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2"
  end

  def install
    system "curl", "-L",
"https://github.com/slhck/ffmpeg-normalize/raw/master/completions/ffmpeg-normalize.bash", "-O"
    bash_completion.install "ffmpeg-normalize.bash" => "ffmpeg-normalize"
    system "curl", "-L",
"https://github.com/slhck/ffmpeg-normalize/raw/master/completions/ffmpeg-normalize.zsh", "-O"
    zsh_completion.install "ffmpeg-normalize.zsh" => "ffmpeg-normalize"
    virtualenv_install_with_resources
  end

  test do
    system bin/"ffmpeg-normalize", "-h"
  end
end
