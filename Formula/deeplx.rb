class Deeplx < Formula
  desc "DeepL Free API (No TOKEN required)"
  homepage "https://github.com/OwO-Network/DeepLX/"
  url "https://github.com/OwO-Network/DeepLX/archive/refs/tags/v#{version}.tar.gz"
  version "0.7.3"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/OwO-Network/DeepLX/releases/download/v#{version}/deeplx_darwin_arm64"
    elsif Hardware::CPU.intel?
      url "https://github.com/OwO-Network/DeepLX/releases/download/v#{version}/deeplx_darwin_amd64"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/OwO-Network/DeepLX/releases/download/v#{version}/deeplx_linux_amd64"
  end

  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "deeplx_darwin_arm64" => "DeepLX"
      elsif Hardware::CPU.intel?
        bin.install "deeplx_darwin_amd64" => "DeepLX"
      end
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "deeplx_linux_amd64" => "DeepLX"
    end
  end

  service do
    run [opt_bin/"DeepLX"]
    keep_alive true
  end

  test do
    system opt_bin/"DeepLX"
  end
end
