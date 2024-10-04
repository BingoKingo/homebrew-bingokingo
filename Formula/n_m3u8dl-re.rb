class NM3u8dlRe < Formula
  desc "Cross-Platform, modern and powerful stream downloader for MPD/M3U8/ISM"
  homepage "https://github.com/nilaoda/N_m3u8DL-RE"
  url "https://github.com/nilaoda/N_m3u8DL-RE/archive/v#{version}.tar.gz"
  version "0.2.1"
  license "MIT"

  date = "20240828"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nilaoda/N_m3u8DL-RE/releases/download/v#{version}-beta/N_m3u8DL-RE_Beta_osx-arm64_#{date}.tar.gz"
      sha256 "ed314d1169e23f30faa1fab1bee28fb319a795219cbc7bab47367f406b85d6b3"
    elsif Hardware::CPU.intel?
      url "https://github.com/nilaoda/N_m3u8DL-RE/releases/download/v#{version}-beta/N_m3u8DL-RE_Beta_osx-x64_#{date}.tar.gz"
      sha256 "f1643c8fa3f9b25ae6e550edb11c5f6aab2c1226292d90a9153de74b55a0dd54"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nilaoda/N_m3u8DL-RE/releases/download/v#{version}-beta/N_m3u8DL-RE_Beta_linux-x64_#{date}.tar.gz"
    sha256 "4cea485a17a5bb91a34b310bb5a5d385a23b69cec970753053d83b25b466baea"
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
