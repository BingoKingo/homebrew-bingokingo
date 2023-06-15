class NM3u8dlRe < Formula
  desc "Cross-Platform, modern and powerful stream downloader for MPD/M3U8/ISM"
  homepage "https://github.com/nilaoda/N_m3u8DL-RE"
  url "https://github.com/nilaoda/N_m3u8DL-RE/archive/refs/tags/v#{version}.tar.gz"
  version "0.1.7"
  license "MIT"

  date = "20230615"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nilaoda/N_m3u8DL-RE/releases/download/v#{version}/N_m3u8DL-RE_Beta_osx-arm64_#{date}.tar.gz"
    elsif Hardware::CPU.intel?
      url "https://github.com/nilaoda/N_m3u8DL-RE/releases/download/v#{version}/N_m3u8DL-RE_Beta_osx-x64_#{date}.tar.gz"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nilaoda/N_m3u8DL-RE/releases/download/v#{version}/N_m3u8DL-RE_Beta_linux-x64_#{date}.tar.gz"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        prefix.install Dir["N_m3u8DL-RE_Beta_osx-arm64/*"]
      elsif Hardware::CPU.intel?
        prefix.install Dir["N_m3u8DL-RE_Beta_osx-x64/*"]
      end
    elsif OS.linux? && Hardware::CPU.intel?
      prefix.install Dir["N_m3u8DL-RE_Beta_linux-x64/*"]
    end
    bin.install "N_m3u8DL-RE"
    bin.install_symlink "#{bin}/N_m3u8DL-RE" => "m3u8dl"
  end

  test do
    system bin/"N_m3u8DL-RE", "--version"
  end
end
