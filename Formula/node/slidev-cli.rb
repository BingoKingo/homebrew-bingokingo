class SlidevCli < Formula
  desc "Presentation slides for developers"
  homepage "https://sli.dev/"
  url "https://registry.npmjs.org/@slidev/cli/-/cli-52.11.5.tgz"
  sha256 "e387c8aceeee3a7219aa41a14096e08aa8d8bf8b8be0224438a2791c664e0a07"
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
