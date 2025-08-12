class GitRemoteRclone < Formula
  include Language::Python::Virtualenv
  desc "Git remote helper for rclone-supported services"
  homepage "https://github.com/rixner/git-remote-rclone/"
  license "GPL-3.0-or-later"
  head "https://github.com/rixner/git-remote-rclone.git", branch: "main"

  depends_on "python@3.13"
  depends_on "rclone"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
    \033[1m[F]\033[0m Successor of https://github.com/datalad/git-remote-rclone
      and https://github.com/redstreet/git-remote-rclone
    EOS
  end
  test do
    system bin/"git-remote-rclone", "-h"
  end
end
