class SlidevCli < Formula
  desc "Presentation slides for developers"
  homepage "https://sli.dev/"
  url "https://registry.npmjs.org/@slidev/cli/-/cli-52.14.1.tgz"
  sha256 "511ec5f7dd6d4f9e626e7efae8ce233bd0db3a5f686a86d23ad019083dfcb6e2"
  license "MIT"
  head "https://github.com/slidevjs/slidev.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any,                 arm64_tahoe:   "a90be02de20e275dee4e38a614790ce980653cb8f0872980f33e54b22e77a196"
    sha256 cellar: :any,                 arm64_sequoia: "bcdfb858ed3dc9898973dde61b180cdb67a9a5581420487ea0c87c8828c3e9c2"
    sha256 cellar: :any,                 arm64_sonoma:  "bcdfb858ed3dc9898973dde61b180cdb67a9a5581420487ea0c87c8828c3e9c2"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "453b79f4d3921718c974270c61e908b25907f80bb7384b52a56c3f9f98d6a253"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f833c28e104761bc0ff07e800b45f0777aa6eed26f277a064a14b4c262850783"
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
