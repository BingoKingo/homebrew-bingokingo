class SlidevCli < Formula
  desc "Presentation slides for developers"
  homepage "https://sli.dev/"
  url "https://registry.npmjs.org/@slidev/cli/-/cli-52.1.0.tgz"
  sha256 "8df9a6869418f806c0c2d31f5429671a728edd30c120a96c1c5563e15dcfcbc3"
  license "MIT"
  head "https://github.com/slidevjs/slidev.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "i", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"slidev", "-h"
  end
end
