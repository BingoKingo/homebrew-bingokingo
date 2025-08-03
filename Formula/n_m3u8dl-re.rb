class NM3u8dlRe < Formula
  desc "Cross-Platform, modern and powerful stream downloader for MPD/M3U8/ISM"
  homepage "https://github.com/nilaoda/N_m3u8DL-RE/"
  url "https://github.com/nilaoda/N_m3u8DL-RE/archive/refs/heads/v#{version}.tar.gz"
  version "0.3.0"
  license "MIT"

  date = "20241203"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nilaoda/N_m3u8DL-RE/releases/download/v#{version}-beta/N_m3u8DL-RE_v#{version}-beta_osx-arm64_#{date}.tar.gz"
      sha256 "eb3488e5af13b969bd3da777f4ff11e514788a966d4bf593df009a8923bdd1fd"
    elsif Hardware::CPU.intel?
      url "https://github.com/nilaoda/N_m3u8DL-RE/releases/download/v#{version}-beta/N_m3u8DL-RE_v#{version}-beta_osx-x64_#{date}.tar.gz"
      sha256 "a75f80872b24ad2e67eef98c8f7edba60db512af83f5bb2cf8bdc3c1de273423"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nilaoda/N_m3u8DL-RE/releases/download/v#{version}-beta/N_m3u8DL-RE_v#{version}-beta_linux-x64_#{date}.tar.gz"
    sha256 "35205154911e8505a7031999b0e35120cda4e2433d964f3a66d6ee9f322398ba"
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
