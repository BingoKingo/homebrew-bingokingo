class Kuberlr < Formula
  desc "Simplify the management of multiple versions of kubectl"
  homepage "https://github.com/flavio/kuberlr/"
  url "https://github.com/flavio/kuberlr/archive/v#{version}.tar.gz"
  version "0.4.5"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/flavio/kuberlr/releases/download/v#{version}/kuberlr_#{version}_darwin_arm64.tar.gz"
      sha256 "29adf6dd4b06648944cda9dc2a3bf8d40dfbe97a0042de6a48a140c1988a391b"
    elsif Hardware::CPU.intel?
      url "https://github.com/flavio/kuberlr/releases/download/v#{version}/kuberlr_#{version}_darwin_amd64.tar.gz"
      sha256 "ddc8557b2b6a004413f22d8b5f8abfca3ba4c47b7f727f98e1bd8296e949fb96"
    else
      url "https://github.com/flavio/kuberlr/releases/download/v#{version}/kuberlr_#{version}_darwin_all.tar.gz"
      sha256 "c334a443091ddef7217a41c318d5a37b4a7f672f2d6cf973f97a891502efaf7f"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/flavio/kuberlr/releases/download/v#{version}/kuberlr_#{version}_linux_amd64.tar.gz"
    sha256 "28959ff8e5add3b714a6c36c042529cfafc3f8c74660b2c56ac2ad969103b091"
  end

  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    prefix.install Dir["kuberlr_#{version}_darwin_arm64/*"]
    bin.install "kuberlr"
  end

  def caveats
    <<~EOS
      `kuberlr` is not symlink as `kubectl` as default
    EOS
  end

  test do
    system bin/"kuberlr", "version"
  end
end
