class WecomCli < Formula
  desc "Official CLI for WeCom"
  homepage "https://github.com/WecomTeam/wecom-cli/"
  url "https://registry.npmjs.org/@wecom/cli/-/cli-0.1.6.tgz"
  sha256 "222470724e33e434cc4e629edc3ded5c64c430347fbdcbe6aec3365177c0c1ac"
  license "MIT"
  head "https://github.com/WecomTeam/wecom-cli.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "i", *std_npm_args
    # system "npx", "skills", "add", "WeComTeam/wecom-cli", "-y", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "wecom-cli #{version}", shell_output("#{bin}/wecom-cli -V")
    assert_match "Usage", shell_output("#{bin}/wecom-cli -h")
    assert_match "Commands", shell_output("#{bin}/wecom-cli -h")
    assert_match "Options", shell_output("#{bin}/wecom-cli -h")
  end
end
