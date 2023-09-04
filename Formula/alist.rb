class Alist < Formula
  desc "File list program that supports multiple storage powered by Gin and Solidjs"
  homepage "https://alist.nn.ci/"
  url "https://github.com/alist-org/alist/archive/refs/tags/v#{version}.tar.gz",
      verified: "github.com/alist-org/alist/"
  version "3.27.0"
  license "AGPL-3.0-only"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-darwin-arm64.tar.gz"
      sha256 "b74d53784389030e03aa43e0913317e1bc34fc4da4611f87738eb096bb18f48b"
    elsif Hardware::CPU.intel?
      url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-darwin-amd64.tar.gz"
      sha256 "00a3b621f7741d10f3d689ae78112f530ba5f596b3bc2d18b2c6d7bc8fd7852a"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-linux-amd64.tar.gz"
    sha256 "ec7f629928f0fda400d8be49f3d1430e804a134c36a6ca07117ea70eab03b59d"
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
      Or reveal password via `sqlite3` command:
        sqlite3 #{etc}/alist/data.db "select password from x_users where username = 'admin'"
    EOS
  end

  test do
    system bin/"alist", "version"
    system bin/"alist", "admin"
  end
end
