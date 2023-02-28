class Kuberlr < Formula
  desc "Simplify the management of multiple versions of kubectl"
  homepage "https://github.com/flavio/kuberlr/"
  url "https://github.com/flavio/kuberlr/archive/refs/tags/v#{version}.tar.gz"
  version "0.4.2"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/flavio/kuberlr/releases/download/v#{version}/kuberlr_#{version}_darwin_arm64.tar.gz"
    elsif Hardware::CPU.intel?
      url "https://github.com/flavio/kuberlr/releases/download/v#{version}/kuberlr_#{version}_darwin_amd64.tar.gz"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/flavio/kuberlr/releases/download/v#{version}/kuberlr_#{version}_linux_amd64.tar.gz"
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
