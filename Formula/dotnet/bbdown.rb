class Bbdown < Formula
  desc "Bilibili Downloader CLI"
  homepage "https://github.com/nilaoda/BBDown/"
  url "https://github.com/nilaoda/BBDown/archive/refs/tags/1.6.3.tar.gz"
  sha256 "b0bd145354327749f9a7293c94dd385eecbbe6118ca7fa93d56e56f2deabaa85"
  license "MIT"
  head "https://github.com/nilaoda/BBDown.git", branch: "master"

  depends_on "dotnet"

  def install
    system "dotnet", "publish", "BBDown", "-c", "Release", "-o", bin.to_s
    rm_r(bin/"BBDown.dsym") if OS.mac?
  end

  test do
    system bin/"BBDown", "--version"
  end
end
