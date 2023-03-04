class Docker2exe < Formula
  desc "Convert a Docker image to an executable"
  homepage "https://github.com/rzane/docker2exe/"
  url "https://github.com/rzane/docker2exe/archive/refs/tags/v#{version}.tar.gz"
  version "0.2.1"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on "go"
  depends_on "gzip"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/rzane/docker2exe/releases/download/v#{version}/docker2exe-darwin-arm64"
    elsif Hardware::CPU.intel?
      url "https://github.com/rzane/docker2exe/releases/download/v#{version}/docker2exe-darwin-amd64"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/rzane/docker2exe/releases/download/v#{version}/docker2exe-linux-amd64"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "docker2exe-darwin-arm64" => "docker2exe"
      elsif Hardware::CPU.intel?
        bin.install "docker2exe-darwin-amd64" => "docker2exe"
      end
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "docker2exe-linux-amd64" => "docker2exe"
    end
  end

  test do
    system bin/"docker2exe", "--help"
  end
end
