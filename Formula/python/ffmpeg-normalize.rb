class FfmpegNormalize < Formula
  include Language::Python::Virtualenv

  desc "Audio Normalization for Python/ffmpeg"
  homepage "https://github.com/slhck/ffmpeg-normalize/"
  url "https://github.com/slhck/ffmpeg-normalize/archive/refs/tags/v1.37.3.tar.gz"
  sha256 "36155d586d16a4faa0a0d1fa1ea8e756d5c272c35228f4f10ba3c927cccae09b"
  license "MIT"
  head "https://github.com/slhck/ffmpeg-normalize.git", branch: "master"

  depends_on "python@3.14"

  resource "colorlog" do
    url "https://files.pythonhosted.org/packages/78/6b/4e5481ddcdb9c255b2715f54c863629f1543e97bc8c309d1c5c131ad14f2/colorlog-6.7.0.tar.gz"
    sha256 "bd94bd21c1e13fac7bd3153f4bc3a7dc0eb0974b8bc2fdf1a989e474f6e582e5"
  end

  resource "ffmpeg-progress-yield" do
    url "https://files.pythonhosted.org/packages/ee/52/ef3dbb7509ec04288908ae5c1ea6cdea880aa8fa1236f37742d9f6639399/ffmpeg_progress_yield-1.1.2.tar.gz"
    sha256 "bebdfb26f1e47dd3a1334692496ed35fb43fb0bbdc7e1b5263b3dde9e02e955e"
  end

  resource "mutagen" do
    url "https://files.pythonhosted.org/packages/81/e6/64bc71b74eef4b68e61eb921dcf72dabd9e4ec4af1e11891bbd312ccbb77/mutagen-1.47.0.tar.gz"
    sha256 "719fadef0a978c31b4cf3c956261b3c58b6948b32023078a2117b1de09f0fc99"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/09/a9/6ba95a270c6f1fbcd8dac228323f2777d886cb206987444e4bce66338dd4/tqdm-4.67.3.tar.gz"
    sha256 "7d825f03f89244ef73f1d4ce193cb1774a8179fd96f31d7e1dcde62092b960bb"
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
    output = shell_output("#{bin}/ffmpeg-normalize -h")
    assert_match "usage", output
    assert_match "ffmpeg-normalize v#{version} -- command line tool for normalizing audio files", output
    assert_match "options", output
    assert_match "File Input/output", output
    assert_match "General Options", output
    assert_match "Normalization", output
    assert_match "Encoding", output
    assert_match "Author: Werner Robitza", output
    assert_match "License: MIT", output
    assert_match "Homepage / Issues", output
    version_output = shell_output("#{bin}/ffmpeg-normalize --version")
    assert_match "ffmpeg-normalize v#{version}", version_output
  end
end
