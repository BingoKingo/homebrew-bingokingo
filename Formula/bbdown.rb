class Bbdown < Formula
  desc "Bilibili Downloader 命令行式哔哩哔哩下载器"
  homepage "https://github.com/nilaoda/BBDown/"
  url "https://github.com/nilaoda/BBDown/archive/refs/tags/#{version}.tar.gz"
  version "1.5.6"
  license "MIT"

  date = "20230526"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nilaoda/BBDown/releases/download/#{version}/BBDown_#{version}_#{date}_osx-arm64.zip"
    elsif Hardware::CPU.intel?
      url "https://github.com/nilaoda/BBDown/releases/download/#{version}/BBDown_#{version}_#{date}_osx-x64.zip"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nilaoda/BBDown/releases/download/#{version}/BBDown_#{version}_#{date}_linux-x64.zip"
  end

  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    bin.install "BBDown"
  end

  test do
    system bin/"BBDown", "--version"
  end
end
