class SlidevCli < Formula
  desc "Presentation slides for developers"
  homepage "https://sli.dev/"
  url "https://registry.npmjs.org/@slidev/cli/-/cli-52.0.0.tgz"
  sha256 "8a27346f30da27414c3b8a22698abaa45d51437345f2e63c308ae322aaaa2949"
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
