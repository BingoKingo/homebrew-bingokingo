class ElectronAsar < Formula
  desc "Creating Electron app packages"
  homepage "https://github.com/electron/asar/"
  url "https://registry.npmjs.org/@electron/asar/-/asar-4.1.0.tgz"
  sha256 "275721a5d21e907875de74dabd3506335bc329016adea8fdc4113e7623b6a64b"
  license "MIT"
  head "https://github.com/electron/asar.git", branch: "main"

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
