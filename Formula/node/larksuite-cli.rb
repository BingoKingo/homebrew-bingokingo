class LarksuiteCli < Formula
  desc "Official CLI for Lark/Feishu open platform"
  homepage "https://github.com/larksuite/cli"
  url "https://registry.npmjs.org/@larksuite/cli/-/cli-1.0.23.tgz"
  sha256 "242c7186fc6df188e03b7ab43d090a562f5bdc401d0f74bee35871cd696a31ba"
  license "MIT"
  head "https://github.com/larksuite/cli.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "i", *std_npm_args
    # system "npx", "skills", "add", "larksuite/cli", "-y", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli -v")
    assert_match "USAGE", shell_output("#{bin}/lark-cli -h")
    assert_match "EXAMPLES", shell_output("#{bin}/lark-cli -h")
    assert_match "FLAGS", shell_output("#{bin}/lark-cli -h")
  end
end
