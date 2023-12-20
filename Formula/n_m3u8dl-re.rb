class NM3u8dlRe < Formula
  desc "Cross-Platform, modern and powerful stream downloader for MPD/M3U8/ISM"
  homepage "https://github.com/nilaoda/N_m3u8DL-RE"
  url "https://github.com/nilaoda/N_m3u8DL-RE/archive/v#{version}.tar.gz"
  version "0.2.0"
  license "MIT"

  date = "20230628"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nilaoda/N_m3u8DL-RE/releases/download/v#{version}-beta/N_m3u8DL-RE_Beta_osx-arm64_#{date}.tar.gz"
      sha256 "339438ac6d6dda67375ac35f5214d1b9f88edadc8a4cf4f1959d67ba14e57612"
    elsif Hardware::CPU.intel?
      url "https://github.com/nilaoda/N_m3u8DL-RE/releases/download/v#{version}-beta/N_m3u8DL-RE_Beta_osx-x64_#{date}.tar.gz"
      sha256 "d6480cfb66cc90175e3cdccc58fe66fc73502e5637692d51a6a8adc26a6ce816"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nilaoda/N_m3u8DL-RE/releases/download/v#{version}-beta/N_m3u8DL-RE_Beta_linux-x64_#{date}.tar.gz"
    sha256 "786eeb1b25875a758fffae441caeb02989cdb8ce09c4018dceae3763a786613f"
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
