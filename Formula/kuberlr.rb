class Kuberlr < Formula
  desc "Simplify the management of multiple versions of kubectl"
  homepage "https://github.com/flavio/kuberlr/"
  url "https://github.com/flavio/kuberlr/archive/v#{version}.tar.gz"
  version "0.4.4"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/flavio/kuberlr/releases/download/v#{version}/kuberlr_#{version}_darwin_arm64.tar.gz"
      sha256 "98ea17f30a62f7759bfb64179bc06dce8a9b722fb32b8689b89cbae3a30bf634"
    elsif Hardware::CPU.intel?
      url "https://github.com/flavio/kuberlr/releases/download/v#{version}/kuberlr_#{version}_darwin_amd64.tar.gz"
      sha256 "16b5a395872d0ceae07ec6f3f88668e08fbd0fd4cf68404896c0a21fc7c0f62e"
    else
      url "https://github.com/flavio/kuberlr/releases/download/v#{version}/kuberlr_#{version}_darwin_all.tar.gz"
      sha256 "847c6e79e4147b3db4a2c02de209e64cc9ad4a2473c27ddb512184a2124a5cec"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/flavio/kuberlr/releases/download/v#{version}/kuberlr_#{version}_linux_amd64.tar.gz"
    sha256 "1755abbe141ff4adc41a3b06908ce0fdbc53419867779e121e4f3415eb0ad172"
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
