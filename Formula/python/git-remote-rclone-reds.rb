# [O] Outdated.
class GitRemoteRcloneReds < Formula
  include Language::Python::Virtualenv
  desc "Git remote helper for rclone-supported services"
  homepage "https://github.com/redstreet/git-remote-rclone/"
  url "https://files.pythonhosted.org/packages/95/69/7b5db265ab09f77ab5e79194bbea159049f72c04b6445d36e130fb46bdac/git_remote_rclone_reds-0.2.tar.gz"
  sha256 "77d708dc422af015517492ae08fb0d7162deaf88814afe07f25d4ca39408f068"
  license "GPL-3.0-or-later"
  head "https://github.com/redstreet/git-remote-rclone.git", branch: "main"

  depends_on "python@3.13"
  depends_on "rclone"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"git-remote-rclone", "-h"
  end
end
