class ElectronAsar < Formula
  desc "Creating Electron app packages"
  homepage "https://github.com/electron/asar/"
  url "https://registry.npmjs.org/@electron/asar/-/asar-4.0.0.tgz"
  sha256 "646c1ac65e0e43589749e336486606c1270d12879b22034f9078d370fd104ec3"
  license "MIT"
  head "https://github.com/electron/asar.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "i", "--engine-strict", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"asar", "-h"
  end
end
