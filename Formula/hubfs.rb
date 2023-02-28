class Hubfs < Formula
  desc "Bilibili Downloader 命令行式哔哩哔哩下载器"
  homepage "https://github.com/winfsp/hubfs/"
  url "https://github.com/winfsp/hubfs/archive/refs/tags/v1.0B1.tar.gz"
  version "1.0.22067"
  license " AGPL-3.0-only"

  if OS.mac?
    url "https://github.com/winfsp/hubfs/releases/download/v1.0B1/hubfs-mac-#{version}.zip"
  elsif OS.linux?
    url "https://github.com/winfsp/hubfs/releases/download/v1.0B1/hubfs-lnx-#{version}.zip"
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
