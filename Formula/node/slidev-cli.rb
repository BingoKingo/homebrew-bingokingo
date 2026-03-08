class SlidevCli < Formula
  desc "Presentation slides for developers"
  homepage "https://sli.dev/"
  url "https://registry.npmjs.org/@slidev/cli/-/cli-52.11.5.tgz"
  sha256 "e387c8aceeee3a7219aa41a14096e08aa8d8bf8b8be0224438a2791c664e0a07"
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
    system bin/"slidev", "-h"
  end
end
