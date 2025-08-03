class GitAnnexRemoteRclone < Formula
  desc "Use rclone supported cloud storage providers with git-annex"
  homepage "https://github.com/git-annex-remote-rclone/git-annex-remote-rclone/"
  url "https://github.com/git-annex-remote-rclone/git-annex-remote-rclone/archive/refs/tags/v0.8.tar.gz"
  sha256 "6da12f46d46613cc5a539057052be7d8aa5259bd973ddff2d6ee460d34cd096c"
  license "GPL-3.0-or-later"
  head "https://github.com/git-annex-remote-rclone/git-annex-remote-rclone.git", branch: "master"

  def install
    bin.install "git-annex-remote-rclone"
  end

  test do
    system bin/"git-annex-remote-rclone", "-h"
  end
end
