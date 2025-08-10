class Hljs < Formula
  desc "Use highlight.js from command-line on HTML file"
  homepage "https://github.com/tzemanovic/highlight.js-cli/"
  url "https://registry.npmjs.org/highlight.js-cli/-/highlight.js-cli-0.1.1.tgz"
  sha256 "6ff565e67afae4b66ee71bfe1933ad17379b3108513ec638c75336a6160d1f0d"
  license "BSD-3-Clause"
  head "https://github.com/tzemanovic/highlight.js-cli.git", branch: "master"
  deprecate! date: "2019-05-30", because: :unmaintained

  depends_on "node"

  def install
    system "npm", "i", "--engine-strict", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"hljs", "-h"
  end
end
