class ElectronAsar < Formula
  desc "Creating Electron app packages"
  homepage "https://github.com/electron/asar/"
  url "https://registry.npmjs.org/@electron/asar/-/asar-4.0.1.tgz"
  sha256 "d2c9020db3934aeed1ec8c2a29c11ad57955f4d341e6dff46d188d1c9df97f56"
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
