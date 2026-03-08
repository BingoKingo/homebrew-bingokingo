class Nomnoml < Formula
  desc "Sassy UML diagram renderer"
  homepage "https://www.nomnoml.com/"
  url "https://registry.npmjs.org/nomnoml/-/nomnoml-1.7.0.tgz"
  sha256 "2c868bb3cc03b58400798121f3c615fa5794fa8ac118302c9724c4df20a9a55e"
  license "MIT"
  head "https://github.com/skanaar/nomnoml.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "6c3c08c3feb1cc912fa357a48d8d58cecd3030638477dae073947d962bda1e99"
  end

  depends_on "node"

  def install
    system "npm", "i", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/nomnoml --help")
    assert_match "Nomnoml command line utility for generating SVG diagrams.", output
  end
end
