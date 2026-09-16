class WecomCli < Formula
  desc "Official CLI for WeCom"
  homepage "https://github.com/WecomTeam/wecom-cli/"
  url "https://registry.npmjs.org/@wecom/cli/-/cli-0.1.6.tgz"
  sha256 "222470724e33e434cc4e629edc3ded5c64c430347fbdcbe6aec3365177c0c1ac"
  license "MIT"
  head "https://github.com/WecomTeam/wecom-cli.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "c6e554ad8d7398cb231c4f1cc4d7515986c1a3ebeae990a5b423197a374be0dc"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c6e554ad8d7398cb231c4f1cc4d7515986c1a3ebeae990a5b423197a374be0dc"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "c6e554ad8d7398cb231c4f1cc4d7515986c1a3ebeae990a5b423197a374be0dc"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "d335489c53843e0c203a7b10c78e14370655fb11ee92c0e4511109782bc4b304"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "30bb780434d98cec59d69f8c08c56d1af010889d41e873fefa5b4e0dc3d61333"
  end

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
