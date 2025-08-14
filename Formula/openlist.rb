class Openlist < Formula
  desc "File list program that supports multiple storage powered by Gin and Solidjs"
  homepage "https://oplist.org/"
  url "https://github.com/OpenListTeam/OpenList/archive/refs/tags/v4.1.0.tar.gz"
  sha256 "cdaf91413fe07b3d8155f644237a839dac09f084e812b25c76effca7dfc1d3f2"
  license "AGPL-3.0-only"
  head "https://github.com/OpenListTeam/OpenList.git", branch: "main"

  depends_on "glib" => :build
  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "vite" => :build

  resource "openlist-web" do
    # pull from git tag to get submodules
    url "https://github.com/OpenListTeam/OpenList-Frontend.git",
       tag:      "v4.1.0",
       revision: "f1e97b2343c851034537958ab2b91b45854d3663"
  end

  def install
    resource("openlist-web").stage do
      system "npm", "i", *std_npm_args
      system "npm", "i", "vite", "--include=dev", "--legacy-peer-deps"
      system "npm", "run", "build"
      (buildpath/"public/dist").install Dir["dist/*"]
    end
    system "go", "build", *std_go_args
    generate_completions_from_executable(bin/"openlist", "completion")
  end

  def post_install
    (var/"log/openlist").mkpath
    (etc/"openlist").mkpath
    prefix.install_symlink etc/"openlist" => opt_prefix/"data"
    ln_s var/"log/openlist", opt_prefix/"data/log"
  end

  service do
    run [opt_bin/"openlist", "server"]
    working_dir opt_prefix
    keep_alive true
  end

  def caveats
    <<~EOS
      To reveal openlist admin user's info in default `config.json` again, run the following command:
        cd #{opt_prefix} && openlist admin
      Or reveal password via `sqlite3` command:
        sqlite3 #{etc}/openlist/data.db "select password from x_users where username = 'admin'"
    EOS
  end

  test do
    system bin/"openlist", "version"
    system bin/"openlist", "admin"
  end
end
