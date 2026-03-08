class SlidevCli < Formula
  desc "Presentation slides for developers"
  homepage "https://sli.dev/"
  url "https://registry.npmjs.org/@slidev/cli/-/cli-52.14.1.tgz"
  sha256 "511ec5f7dd6d4f9e626e7efae8ce233bd0db3a5f686a86d23ad019083dfcb6e2"
  license "MIT"
  head "https://github.com/slidevjs/slidev.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any,                 arm64_tahoe:   "6f8cfef498faee2060b6fa01ea2d5c6dccdc5955ab081b5eb7568984226f2728"
    sha256 cellar: :any,                 arm64_sequoia: "9c75f7bb551d2f3ccc4a7a08600623d3466f4562098781fac5eff6fa251d1f2c"
    sha256 cellar: :any,                 arm64_sonoma:  "9c75f7bb551d2f3ccc4a7a08600623d3466f4562098781fac5eff6fa251d1f2c"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "40960616d4169a22b652d2c34131e36f2e48954b9a05ae14989d6634ee6ab52c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "79925f115c604c187e56c5361817c20eec855b052effb23d4df575bd85581124"
  end

  depends_on "node"

  def install
    system "npm", "i", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/slidev -h")
    assert_match "slidev", output
    assert_match "Commands", output
    assert_match "Positionals", output
    assert_match "Options", output
    version_output = shell_output("#{bin}/slidev -v")
    assert_match version.to_s, version_output
  end
end
