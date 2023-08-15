class Kuberlr < Formula
  desc "Simplify the management of multiple versions of kubectl"
  homepage "https://github.com/flavio/kuberlr/"
  url "https://github.com/flavio/kuberlr/archive/v#{version}.tar.gz"
  version "0.4.2"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/flavio/kuberlr/releases/download/v#{version}/kuberlr_#{version}_darwin_arm64.tar.gz"
      sha256 "1b5935ce85b182822d362953c0526b2611f108a563d106071db42ed4d116f8e4"
    elsif Hardware::CPU.intel?
      url "https://github.com/flavio/kuberlr/releases/download/v#{version}/kuberlr_#{version}_darwin_amd64.tar.gz"
      sha256 "171a81dc391599f186a0bb367c17f4972ec802e9ac20b1441b9552d72120c34c"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/flavio/kuberlr/releases/download/v#{version}/kuberlr_#{version}_linux_amd64.tar.gz"
    sha256 "ad7c52733e4cdf57d01d64ab36c870e5074a12b1a580ecb77c72e467aeef599b"
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
