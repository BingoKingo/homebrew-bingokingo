class FfmpegNormalize < Formula
  include Language::Python::Virtualenv
  desc "Audio Normalization for Python/ffmpeg"
  homepage "https://github.com/slhck/ffmpeg-normalize/"
  url "https://github.com/slhck/ffmpeg-normalize/archive/refs/tags/v1.32.5.tar.gz"
  sha256 "b599f62a116109e3cfe89fa36bf9d5ef6323bee1b3f79d6894cf39080cb2afb1"
  license "MIT"
  head "https://github.com/slhck/ffmpeg-normalize.git", branch: "master"

  depends_on "python@3.13"

  resource "colorlog" do
    url "https://files.pythonhosted.org/packages/d3/7a/359f4d5df2353f26172b3cc39ea32daa39af8de522205f512f458923e677/colorlog-6.9.0.tar.gz"
    sha256 "bfba54a1b93b94f54e1f4fe48395725a3d92fd2a4af702f6bd70946bdc0c6ac2"
  end

  resource "ffmpeg-progress-yield" do
    url "https://files.pythonhosted.org/packages/88/b1/1f88ee6006f212e36e2d1867d20bdaffd0f5a065c17d34c7083a3b03b4f3/ffmpeg_progress_yield-1.0.1-py3-none-any.whl"
    sha256 "3c24844110accc84d48bde8c7c4d5a8c163cc652f1cf0e2f62c803565ae42dae"
  end

  resource "mutagen" do
    url "https://files.pythonhosted.org/packages/81/e6/64bc71b74eef4b68e61eb921dcf72dabd9e4ec4af1e11891bbd312ccbb77/mutagen-1.47.0.tar.gz"
    sha256 "719fadef0a978c31b4cf3c956261b3c58b6948b32023078a2117b1de09f0fc99"
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
