class Docker2exe < Formula
  desc "Convert a Docker image to an executable"
  homepage "https://github.com/rzane/docker2exe/"
  url "https://github.com/rzane/docker2exe/archive/v#{version}.tar.gz"
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
      sha256 "89e2509e944ca6f27e7e9afda4b68b38f36543a3cdbd10a43ca3fadaa040248c"
    elsif Hardware::CPU.intel?
      url "https://github.com/rzane/docker2exe/releases/download/v#{version}/docker2exe-darwin-amd64"
      sha256 "173c021d6953f76c50ba710228415ec62aca5e29e7157b12074f46379693f1f6"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/rzane/docker2exe/releases/download/v#{version}/docker2exe-linux-amd64"
    sha256 "cc58c341c9c48ee6d71ff9efa7d76ff342cf5bdc9f0b6891d89a17627265a819"
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
