class Bytenode < Formula
  desc "A minimalist bytecode compiler for Node.js"
  homepage "https://github.com/bytenode/bytenode/"
  url "https://registry.npmjs.org/bytenode/-/bytenode-1.5.6.tgz"
  sha256 "2bafb105bc2bb663fcdd76f7c9143f4ee4fb401b9bd51c28d3db4ec9f8b8b3cb"
  license "MIT"
  head "https://github.com/bytenode/bytenode.git", branch: "master"

  depends_on "node"

  def install
    system "npm", "i", "--engine-strict", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"bytenode", "-h"
  end
end
