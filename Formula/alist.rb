class Alist < Formula
  desc "File list program that supports multiple storage powered by Gin and Solidjs"
  homepage "https://alist.nn.ci/"
  url "https://github.com/alist-org/alist/archive/refs/tags/v#{version}.tar.gz",
      verified: "github.com/alist-org/alist/"
  version "3.26.0"
  license "AGPL-3.0-only"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-darwin-arm64.tar.gz"
      sha256 "8fc01c603e1f48a72e0d47eb9f283ceaecd97672890b776a3c183d9e8e9ec1ac"
    elsif Hardware::CPU.intel?
      url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-darwin-amd64.tar.gz"
      sha256 "d4d64db13fc1f52404c8c4e347bb67d9ec1cc45b96cd6b2829a30b8227cce6aa"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-linux-amd64.tar.gz"
    sha256 "555a8482aeedb15a0e28a7a6e19868d417816d3f23b37b68cab597b7bfc10c9a"
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
