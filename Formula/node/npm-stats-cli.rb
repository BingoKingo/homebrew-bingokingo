class NpmStatsCli < Formula
  desc "Command-line interface for npm registry statistics and insights"
  homepage "https://github.com/tobilg/npm-stats-cli/"
  url "https://registry.npmjs.org/npm-stats-cli/-/npm-stats-cli-0.2.2.tgz"
  sha256 "7e3fd2ef8eb79911345bc4abf84ff650c5b9a88b88da63942f0e13f2448f0d8c"
  license "MIT"
  head "https://github.com/tobilg/npm-stats-cli.git", branch: "master"

  depends_on "node"

  def install
    system "npm", "i", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"npm-stats", "--help"
  end
end
