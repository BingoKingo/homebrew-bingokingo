class ElectronAsar < Formula
  desc "Creating Electron app packages"
  homepage "https://github.com/electron/asar/"
  url "https://registry.npmjs.org/@electron/asar/-/asar-4.1.0.tgz"
  sha256 "275721a5d21e907875de74dabd3506335bc329016adea8fdc4113e7623b6a64b"
  license "MIT"
  head "https://github.com/electron/asar.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "36f82e20fb7b8b57e04ff97d3d63fd75cba572875ddad79d1a009081aa8ee889"
  end

  depends_on "node"

  def install
    system "npm", "i", "--engine-strict", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/asar -h")
    assert_match "Usage", output
    assert_match "Options", output
    assert_match "Commands", output
    version_output = shell_output("#{bin}/asar -V")
    assert_match "v#{version}", version_output
  end
end
