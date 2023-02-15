class Link < Formula
  desc "Create symlinks, shimscripts for favourites in a homebrew bin"
  url ""
  homepage "https://github.com/BingoKingo/homebrew-tap"
  version "1"

  def install
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/trash" => "rm"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/HandBrakeCLI" => "handbrake"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/7z" => "7-zip"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/7z" => "7zip"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/7z" => "7zz"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/transmission-remote" => "transmission"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/vlc" => "cvlc"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/firefoxpwa" => "librewolfpwa"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/hx" => "helix"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/neomutt" => "mutt"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/brew-gem" => "gem"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/rclone-mac" => "rclone"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/ntfs-3g" => "ntfs"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/ntfs-3g.probe" => "ntfs.probe"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/lowntfs-3g" => "lowntfs"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/simple-mtpfs" => "mtpfs"

  end

  test do

  end

