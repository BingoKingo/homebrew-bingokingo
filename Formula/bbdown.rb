class Bbdown < Formula
  desc "Bilibili Downloader CLI"
  homepage "https://github.com/nilaoda/BBDown/"
  url "https://github.com/nilaoda/BBDown/archive/#{version}.tar.gz"
  version "1.6.0"
  license "MIT"

  date = "20230715"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nilaoda/BBDown/releases/download/#{version}/BBDown_#{version}_#{date}_osx-arm64.zip"
      sha256 "5bb1ab8987a33be08ad07367d2e70ea4f18868ba4538a77019aba48e76ed7892"
    elsif Hardware::CPU.intel?
      url "https://github.com/nilaoda/BBDown/releases/download/#{version}/BBDown_#{version}_#{date}_osx-x64.zip"
      sha256 "13c823fbbc1497ac26eb2d9eaac90604e8e5214e06c6612503c82c1332afc291"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nilaoda/BBDown/releases/download/#{version}/BBDown_#{version}_#{date}_linux-x64.zip"
    sha256 "ae8a3299a3f5be023446339ab3eb7d54cb6bc8b9e44dc5c98a1fd72a32b474dc"
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
