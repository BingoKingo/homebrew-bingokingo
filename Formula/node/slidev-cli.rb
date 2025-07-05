class SlidevCli < Formula
  desc "Presentation slides for developers"
  homepage "https://sli.dev/"
  url "https://registry.npmjs.org/@slidev/cli/-/cli-51.1.0.tgz"
  sha256 "904b3d06d6a7a5df47c77bbdbdcf4b265c24ad122623250785ca467235a4da2d"
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
