class UglifyJs < Formula
  desc "JavaScript parser, minifier, compressor and beautifier toolkit"
  homepage "https://github.com/mishoo/UglifyJS/"
  url "https://registry.npmjs.org/uglify-js/-/uglify-js-3.19.3.tgz"
  sha256 "744d9f31fe424514dd44728daa3e562a703fca53b6627ddeb655f77c2aa88ab4"
  license "BSD-2-Clause"
  head "https://github.com/mishoo/UglifyJS.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "d2258afe2c235dd1c6440528398ea33373807b3df9b048f3a2b88e6c1de522dc"
  end

  depends_on "libnghttp2"
  depends_on "libngtcp2"
  depends_on "node"
  depends_on "uvwasi"

  def install
    system "npm", "i", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
    bin.install_symlink "uglifyjs" => "uglify-js"
  end

  test do
    output = shell_output("#{bin}/uglifyjs -h")
    assert_match "Usage", output
    assert_match "Options", output
    version_output = shell_output("#{bin}/uglifyjs -v")
    assert_match "uglify-js #{version}", version_output
  end
end
