class Kuberlr < Formula
  desc "Simplify the management of multiple versions of kubectl"
  homepage "https://github.com/flavio/kuberlr/"
  url "https://github.com/flavio/kuberlr/archive/v#{version}.tar.gz"
  version "0.5.2"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/flavio/kuberlr/releases/download/v#{version}/kuberlr_#{version}_darwin_arm64.tar.gz"
      sha256 "b9ac9c0e25bb3e88255df8161f19ba81291388e11e26d5f5e0307126e9f26fe1"
    elsif Hardware::CPU.intel?
      url "https://github.com/flavio/kuberlr/releases/download/v#{version}/kuberlr_#{version}_darwin_amd64.tar.gz"
      sha256 "28e959d534c8b12451e626504191df903ac6ca6071fdfdf7de81a420c90b27f7"
    else
      url "https://github.com/flavio/kuberlr/releases/download/v#{version}/kuberlr_#{version}_darwin_all.tar.gz"
      sha256 "56059d9dd0ed2c42b8d306ea8d99f08bc335c8e6beff211aa6d18e0ed7d19e7b"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/flavio/kuberlr/releases/download/v#{version}/kuberlr_#{version}_linux_amd64.tar.gz"
    sha256 "17beba3b30a1a518bdc567688e7040cea419365ab00f09fbfa09b2b335988068"
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
    system opt_bin/"kuberlr", "version"
  end
end
