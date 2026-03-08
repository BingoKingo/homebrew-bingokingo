class Bytenode < Formula
  desc "Minimalist bytecode compiler for Node.js"
  homepage "https://github.com/bytenode/bytenode/"
  url "https://registry.npmjs.org/bytenode/-/bytenode-1.5.7.tgz"
  sha256 "b4caf24f694f856474c6fd92577a4c336f1a4a609a1e2b44f4d0316ee2b5d867"
  license "MIT"
  head "https://github.com/bytenode/bytenode.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "c446c54bc4b7d27c6e0e4e5092030c3b1cc7374924bf1bd9f2c169e629cdc28c"
  end

  depends_on "node"

  def install
    system "npm", "i", "--engine-strict", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"bytenode", "-h"
  end
end
