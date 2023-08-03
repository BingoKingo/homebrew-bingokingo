class Alist < Formula
  desc "File list program that supports multiple storage powered by Gin and Solidjs"
  homepage "https://alist.nn.ci/"
  url "https://github.com/alist-org/alist/archive/refs/tags/v#{version}.tar.gz",
      verified: "github.com/alist-org/alist/"
  version "3.24.0"
  license "AGPL-3.0-only"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-darwin-arm64.tar.gz"
    elsif Hardware::CPU.intel?
      url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-darwin-amd64.tar.gz"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-linux-amd64.tar.gz"
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
    run [opt_bin/"alist", "server", "--data", opt_prefix/"data"]
    working_dir opt_prefix
    keep_alive true
  end

  def caveats
    <<~EOS
      To reveal alist admin user's info again, run the following command:
      cd #{opt_prefix} && alist admin
      Or reveal password via `sqlite3` command:
      sqlite3 #{etc}/alist/data.db "select password from x_users where username = 'admin'"
      NOTICE: `--data` parameter may not work. If you need to run elsewhere with same configuration, please navigate to `#{opt_prefix}` first.
      EOS
  end

  test do
    system bin/"alist", "version"
    system bin/"alist", "admin"
  end
end
