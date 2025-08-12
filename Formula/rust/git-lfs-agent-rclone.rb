class GitLfsAgentRclone < Formula
  desc "Custom transfer agent for git-lfs that uses rclone to transfer files"
  homepage "https://github.com/yaito6502/git-lfs-agent-rclone"
  url "https://github.com/yaito6502/git-lfs-agent-rclone/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "9578590aa2d4fb06125dc7d52186d07dc22667bd015c255d6a58d1805edf537f"
  license "WTFPL"
  head "https://github.com/yaito6502/git-lfs-agent-rclone.git", branch: "main"

  depends_on "rust" => :build
  depends_on "git"

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      \033[1m[F]\033[0m Fork of https://github.com/funatsufumiya/git-lfs-agent-rclone
    EOS
  end
  test do
    system bin/"git-lfs-agent-rclone", "-h"
  end
end
