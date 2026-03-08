class Spoof < Formula
  desc "Easily spoof your MAC address"
  homepage "https://feross.org/spoofmac/"
  url "https://registry.npmjs.org/spoof/-/spoof-2.0.4.tgz"
  sha256 "d2bf5b3cf5dfa97543b4d56b5419318de9b41a7e94ce92c45a54d71e20be3705"
  license "MIT"
  head "https://github.com/feross/spoof.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "31af919da3e5fac0d7287e790a3c9bb2c53a9ef6f6c7388604ec7b09c76c2398"
  end

  depends_on "node"

  def install
    system "npm", "i", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/spoof help")
    assert_match "spoof - Spoof your MAC address", output
    assert_match "Example", output
    assert_match "Usage", output
    assert_match "Options", output
    version_output = shell_output("#{bin}/spoof version")
    assert_match version.to_s, version_output
  end
end
