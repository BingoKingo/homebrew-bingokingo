class Alist < Formula
  desc "File list program that supports multiple storage powered by Gin and Solidjs"
  homepage "https://alist.nn.ci/"
  url "https://github.com/alist-org/alist/archive/v#{version}.tar.gz",
      verified: "github.com/alist-org/alist/"
  version "3.28.0"
  license "AGPL-3.0-only"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-darwin-arm64.tar.gz"
      sha256 "8e4ec21ea43292659f0ab8e8c1f9e1fdb64c993dd29eb6a63ccc112e44bb3931"
    elsif Hardware::CPU.intel?
      url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-darwin-amd64.tar.gz"
      sha256 "b8e59da89377165cee885375bb92a3d7e01a83d5d119229a56f47eda331eeb35"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-linux-amd64.tar.gz"
    sha256 "894e1b58da5a8e54fc27e277f3d4c25aa00df0e1e748e50619ce7d89b176bbec"
  end

  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    bin.install "alist"
  end

  def post_install
    (var/"log/alist").mkpath
    (etc/"alist").mkpath
    prefix.install_symlink etc/"alist" => opt_prefix/"data"
    ln_s var/"log/alist", opt_prefix/"data/log"
  end

  service do
    run [opt_bin/"alist", "server"]
    working_dir opt_prefix
    keep_alive true
  end

  def caveats
    <<~EOS
      To reveal alist admin user's info in default `config.json` again, run the following command:
        cd #{opt_prefix} && alist admin
      Or reveal `admin` password via `sqlite3` command (before v3.25.1):
        sqlite3 #{etc}/alist/data.db "select password from x_users where username = 'admin'"
      Or reset `admin` password:
        cd #{opt_prefix} && alist admin random
      Or set new `admin` password:
        cd #{opt_prefix} && alist admin set NEW_PASSWORD
    EOS
  end

  test do
    system bin/"alist", "version"
    system bin/"alist", "admin"
  end
end
