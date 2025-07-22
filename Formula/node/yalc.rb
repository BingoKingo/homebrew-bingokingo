class Yalc < Formula
  desc "Work with npm/yarn packages locally like a boss"
  homepage "https://github.com/whitecolor/yalc/"
  url "https://registry.npmjs.org/yalc/-/yalc-1.0.0-pre.53.tgz"
  sha256 "78a97cd2051cae8ff9bc1fa76210b66b38e12aaeed46784ea052364558aa58f2"
  license "MIT"
  head "https://github.com/whitecolor/yalc.git", branch: "master"

  depends_on "node"

  def install
    system "npm", "i", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"yalc", "help"
  end
end
