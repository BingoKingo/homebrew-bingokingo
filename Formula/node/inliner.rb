class Inliner < Formula
  desc "Node utility to inline images, CSS and JavaScript for a web page"
  homepage "https://github.com/remy/inliner/"
  url "https://registry.npmjs.org/inliner/-/inliner-1.13.1.tgz"
  sha256 "3ff4e1060b088ccd7999fe6cf7ef301970cd1f7965b08ed61c4828eb8e4cdeee"
  license "MIT"
  head "https://github.com/remy/inliner.git", branch: "master"

  depends_on "node"

  def install
    system "npm", "i", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"inliner", "-h"
  end
end
