class Nomnoml < Formula
  desc "Sassy UML diagram renderer"
  homepage "https://www.nomnoml.com/"
  url "https://registry.npmjs.org/nomnoml/-/nomnoml-1.7.0.tgz"
  sha256 "2c868bb3cc03b58400798121f3c615fa5794fa8ac118302c9724c4df20a9a55e"
  license "MIT"
  head "https://github.com/skanaar/nomnoml.git", branch: "master"

  depends_on "node"

  def install
    system "npm", "i", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"nomnoml", "--help"
  end
end
