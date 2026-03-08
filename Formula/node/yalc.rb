class Yalc < Formula
  desc "Work with npm/yarn packages locally like a boss"
  homepage "https://github.com/whitecolor/yalc/"
  url "https://registry.npmjs.org/yalc/-/yalc-1.0.0-pre.53.tgz"
  sha256 "78a97cd2051cae8ff9bc1fa76210b66b38e12aaeed46784ea052364558aa58f2"
  license "MIT"
  head "https://github.com/whitecolor/yalc.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "310e256def40ec83a480c6c749a7ceca53380a4d25b6f8662e79a29a5bfd56eb"
  end

  depends_on "node"

  def install
    system "npm", "i", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/yalc help")
    assert_match "yalc", output
    assert_match "Commands", output
    assert_match "Options", output
    version_output = shell_output("#{bin}/yalc --version")
    assert_match version.to_s, version_output
  end
end
