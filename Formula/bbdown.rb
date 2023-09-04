class Bbdown < Formula
  desc "Bilibili Downloader CLI"
  homepage "https://github.com/nilaoda/BBDown/"
  url "https://github.com/nilaoda/BBDown/archive/#{version}.tar.gz"
  version "1.6.1"
  license "MIT"

  date = "20230818"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nilaoda/BBDown/releases/download/#{version}/BBDown_#{version}_#{date}_osx-arm64.zip"
      sha256 "d0c9a7603833a466eb153a17279748c43a9ca77d10a84df68c0d66bba1ed6d8b"
    elsif Hardware::CPU.intel?
      url "https://github.com/nilaoda/BBDown/releases/download/#{version}/BBDown_#{version}_#{date}_osx-x64.zip"
      sha256 "69e8f1affbbd479847a0d169e23ed4be8051d1627e0067dd9fc1711f72401a6a"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nilaoda/BBDown/releases/download/#{version}/BBDown_#{version}_#{date}_linux-x64.zip"
    sha256 "69e8f1affbbd479847a0d169e23ed4be8051d1627e0067dd9fc1711f72401a6a"
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
