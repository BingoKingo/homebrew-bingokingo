class Bbdown < Formula
  desc "Bilibili Downloader CLI"
  homepage "https://github.com/nilaoda/BBDown/"
  url "https://github.com/nilaoda/BBDown/archive/refs/heads/#{version}.tar.gz"
  version "1.6.3"
  license "MIT"

  date = "20240814"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nilaoda/BBDown/releases/download/#{version}/BBDown_#{version}_#{date}_osx-arm64.zip"
      sha256 "4df84014d818bd6dff2b365b847645340e8955c4450fe965688f41af89a38baa"
    elsif Hardware::CPU.intel?
      url "https://github.com/nilaoda/BBDown/releases/download/#{version}/BBDown_#{version}_#{date}_osx-x64.zip"
      sha256 "262c15ca7890898560d00e5ffd5ada1864fbd9d0d58ac4ee492c9f3e73f3ae5f"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nilaoda/BBDown/releases/download/#{version}/BBDown_#{version}_#{date}_linux-x64.zip"
    sha256 "ec233b7d8d40b1cc4447dac05be343f53a757dc605743a8808abaa8e97e5d10e"
  end

  def install
    bin.install "BBDown" => "bbdown"
  end

  test do
    system bin/"bbdown", "--version"
  end
end
