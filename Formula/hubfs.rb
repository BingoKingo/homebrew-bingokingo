class Hubfs < Formula
  desc "File system for GitHub and GitLab"
  homepage "https://github.com/winfsp/hubfs/"
  url "https://github.com/winfsp/hubfs/archive/refs/tags/v#{version}.tar.gz"
  version "1.0B1"
  license "AGPL-3.0-only"

  ver = "1.0.22067"

  if OS.mac?
    url "https://github.com/winfsp/hubfs/releases/download/v1.0B1/hubfs-mac-#{ver}.zip"
  elsif OS.linux?
    url "https://github.com/winfsp/hubfs/releases/download/v1.0B1/hubfs-lnx-#{ver}.zip"
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
