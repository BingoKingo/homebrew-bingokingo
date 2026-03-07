class Inliner < Formula
  desc "Node utility to inline images, CSS and JavaScript for a web page"
  homepage "https://github.com/remy/inliner/"
  url "https://registry.npmjs.org/inliner/-/inliner-1.13.1.tgz"
  sha256 "3ff4e1060b088ccd7999fe6cf7ef301970cd1f7965b08ed61c4828eb8e4cdeee"
  license "MIT"
  head "https://github.com/remy/inliner.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "5a770150e5bfc3cf32b9e98957fa89c02d9466ab3b7d2cbe63db1dc3db4900df"
  end

  depends_on "node"

  def install
    system "npm", "i", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/inliner -h")
    assert_match "Usage", output
    assert_match "Flags", output
    assert_match "Options", output
    assert_match "Examples", output
    version_output = shell_output("#{bin}/inliner -V")
    assert_match version.to_s, version_output
  end
end
