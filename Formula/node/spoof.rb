class Spoof < Formula
  desc "Easily spoof your MAC address"
  homepage "https://feross.org/spoofmac/"
  url "https://registry.npmjs.org/spoof/-/spoof-2.0.4.tgz"
  sha256 "d2bf5b3cf5dfa97543b4d56b5419318de9b41a7e94ce92c45a54d71e20be3705"
  license "MIT"
  head "https://github.com/feross/spoof.git", branch: "master"

  depends_on "node"

  def install
    system "npm", "i", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"spoof", "-h"
  end
end
