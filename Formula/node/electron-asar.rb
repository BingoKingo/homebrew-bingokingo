class ElectronAsar < Formula
  desc "Creating Electron app packages"
  homepage "https://github.com/electron/asar/"
  url "https://registry.npmjs.org/@electron/asar/-/asar-3.2.18.tgz"
  sha256 "c1037056082e246670a066a4ca11f83eba0e4fcc1a15da5769740ba7e97e20fb"
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
