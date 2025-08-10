class Hubfs < Formula
  desc "File system for GitHub and GitLab"
  homepage "https://github.com/winfsp/hubfs/"
  url "https://github.com/winfsp/hubfs/archive/refs/heads/v#{version}.tar.gz"
  version "1.0B1"
  sha256 "c59d523f394428d04e3dd32821ce7a05043175dec10d3e6e25cbcee227409398"
  license "AGPL-3.0-only"
  head "https://github.com/winfsp/hubfs.git", branch: "master"

  ver = "1.0.22067"
  deprecate! date: "2022-05-13", because: :unmaintained
  if OS.mac?
    url "https://github.com/winfsp/hubfs/releases/download/v#{version}/hubfs-mac-#{ver}.zip"
    sha256 "30c9433797a8e333d0ea1b214aa1bc0c3b250e309d6764e4c2022db49c1d3c11"
  elsif OS.linux?
    url "https://github.com/winfsp/hubfs/releases/download/v#{version}/hubfs-lnx-#{ver}.zip"
    sha256 "d2b7360576f094db73a3578d2a65d9500ade2c1d94b81026123ba6dca9aa683a"
  end

  def install
    bin.install "hubfs"
  end

  def caveats
    <<~EOS
      The cache folder is here:
        ~/Library/Caches/hubfs
    EOS
  end

  test do
    system bin/"hubfs", "-version"
  end
end
