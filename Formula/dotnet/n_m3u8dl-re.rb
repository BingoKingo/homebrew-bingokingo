class NM3u8dlRe < Formula
  desc "Cross-Platform, modern and powerful stream downloader for MPD/M3U8/ISM"
  homepage "https://github.com/nilaoda/N_m3u8DL-RE/"
  url "https://github.com/nilaoda/N_m3u8DL-RE/archive/refs/tags/v0.3.0-beta.tar.gz"
  sha256 "6cbad6b6fda2733099cabb3cc1f89884984bdfb644416f14713d9bcdd0e55676"
  license "MIT"
  head "https://github.com/nilaoda/N_m3u8DL-RE.git", branch: "main"

  depends_on "dotnet"

  def install
    args = %W[
      --self-contained true
      -c Release
      -p:PublishTrimmed=true
      -p:DebugType=None
      -p:DebugSymbols=false
      -o #{bin}
    ]

    system "dotnet", "publish", "src/N_m3u8DL-RE/N_m3u8DL-RE.csproj", *args
    bin.install_symlink bin/"N_m3u8DL-RE" => "m3u8dl"
    rm_r(bin/"N_m3u8DL-RE.dSYM") if OS.mac?
  end

  test do
    system bin/"N_m3u8DL-RE", "--version"
  end
end
