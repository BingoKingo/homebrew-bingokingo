class GitLfsAgentRclone < Formula
  desc "Custom transfer agent for git-lfs that uses rclone to transfer files"
  homepage "https://github.com/yaito6502/git-lfs-agent-rclone"
  url "https://github.com/yaito6502/git-lfs-agent-rclone/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "9578590aa2d4fb06125dc7d52186d07dc22667bd015c255d6a58d1805edf537f"
  license "WTFPL"
  head "https://github.com/yaito6502/git-lfs-agent-rclone.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any,                 arm64_tahoe:   "71688f6a0504b335c4f391adde888af5e7a1043d959597b13548261681a626ef"
    sha256 cellar: :any,                 arm64_sequoia: "7801cbf2a8a171443a297f60c36dc8beb1ac4d821611cb5cedcb0470ec80fa0d"
    sha256 cellar: :any,                 arm64_sonoma:  "01493e8012ac2f442ade88bb48877b00021e8cf568311ff262778945493258ea"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "91f2af8af8127f5c1f92703300eb4eb915e66f7ea798961dee0eac84663ec681"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5ea1fa6e1d754a32f679a67bae0e4c6e0e4108f5ea6d62ef47678c341ecb9e97"
  end

  depends_on "rust" => :build
  depends_on "git"

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      [F] Fork of https://github.com/funatsufumiya/git-lfs-agent-rclone
    EOS
  end

  test do
    output = shell_output("#{bin}/git-lfs-agent-rclone -h")
    assert_match "git-lfs-agent-rclone v#{version}", output
    assert_match "Usage", output
  end
end
