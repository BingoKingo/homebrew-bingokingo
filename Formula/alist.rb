class Alist < Formula
  desc "File list program that supports multiple storage powered by Gin and Solidjs"
  homepage "https://alist.nn.ci/"
  url "https://github.com/alist-org/alist/archive/v#{version}.tar.gz",
      verified: "github.com/alist-org/alist/"
  version "3.29.1"
  license "AGPL-3.0-only"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-darwin-arm64.tar.gz"
      sha256 "78b6d3071b6ef8afbb8d2c3c4fdc88627f1e0e1fa61e76675fd4731596c2c965"
    elsif Hardware::CPU.intel?
      url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-darwin-amd64.tar.gz"
      sha256 "64d2fdcab56b35ac8bc2e84def30f883aa3c3b4603f0b921f066af41f45a0a8c"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-linux-amd64.tar.gz"
    sha256 "81f66e521fe48cb18daadab2d175116201d3ef6b5d5d7bbac1835493eb6e1c81"
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
