class BytefieldSvg < Formula
  desc "Generates byte field diagrams in SVG format"
  homepage "https://github.com/Deep-Symmetry/bytefield-svg/"
  url "https://registry.npmjs.org/bytefield-svg/-/bytefield-svg-1.11.0.tgz"
  sha256 "811552e58e93d1106cb634ddeec1f68db4e6371f9edc56cf1787b82202478e80"
  license "EPL-2.0"
  head "https://github.com/Deep-Symmetry/bytefield-svg.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "i", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"bytefield-svg", "-h"
  end
end
