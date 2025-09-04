class Openlist < Formula
  desc "File list program that supports multiple storage powered by Gin and Solidjs"
  homepage "https://oplist.org/"
  url "https://github.com/OpenListTeam/OpenList/archive/refs/tags/v4.1.1.tar.gz"
  sha256 "19233fbe67d848e1212b8c23e8af145b1c23533a2c09fd66c141d2de05b9b15c"
  license "AGPL-3.0-only"
  head "https://github.com/OpenListTeam/OpenList.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any,                 arm64_tahoe:   "edc0b6734b821adada1f98e7275ca6bd0cd52001800a0a6403b5f077dddafab0"
    sha256 cellar: :any,                 arm64_sequoia: "084829efe0d0cf6757cff6b2cbef232d6c196ecc88e0bc1b4c5ad8fb79afa7a1"
    sha256 cellar: :any,                 arm64_sonoma:  "4d7e797bad22fbc07d6358aaa2104c9aac907b7227fd27d497fa4558a3d57182"
    sha256 cellar: :any,                 ventura:       "d37741431642245a0796cc2cad174da5df83372fc7597c1d51ffd602034b20fb"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "d8834980c3236975e9c3d00c43830e92bc1cd1469178d0b6de633dc206eaef7f"
    sha256 cellar: :any,                 x86_64_linux:  "8af77e3d197696d55011eb30e7d6c68cd2af0929af80790fd1b516c878dffcf6"
  end

  depends_on "glib" => :build
  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "vite" => :build

  resource "openlist-web" do
    url "https://github.com/OpenListTeam/OpenList-Frontend.git", branch: "main"
  end

  patch do
    url "https://github.com/BingoKingo/homebrew-bingokingo/raw/refs/heads/test/Formula/openlist.patch"
    sha256 "b0f726255c17b161f8c26fa34e4325156a1e6c43d9fdc6f9cb42ed43ca75fc83"
  end

  def install
    resource("openlist-web").stage do
      system "npm", "i", *std_npm_args
      system "npm", "i", "vite", "--include=dev", "--legacy-peer-deps"
      system "npm", "run", "build"
      (buildpath/"public/dist").install Dir["dist/*"]
    end

    # built_at = Time.now.strftime("%F %T %z")
    # go_version = Utils.safe_popen_read("go", "version").sub("go version ", "").strip
    # git_commit = Utils.safe_popen_read("git", "ls-remote", "https://github.com/OpenListTeam/OpenList", "refs/tags/v#{version}").split.first&.[](0, 7)
    # git_author = "The OpenList Projects Contributors <noreply@openlist.team>"

    # ldflags = %W[
    #   -s -w
    #   -X github.com/OpenListTeam/OpenList/internal/conf.BuiltAt="#{built_at}"
    #   -X github.com/OpenListTeam/OpenList/internal/conf.GoVersion="#{go_version}"
    #   -X github.com/OpenListTeam/OpenList/internal/conf.GitAuthor="#{git_author}"
    #   -X github.com/OpenListTeam/OpenList/internal/conf.GitCommit="#{git_commit}"
    #   -X github.com/OpenListTeam/OpenList/internal/conf.Version="#{version}"
    #   -X github.com/OpenListTeam/OpenList/internal/conf.WebVersion="Rolling"
    # ]

    # system "go", "build", *std_go_args(ldflags: ldflags)
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
    run [opt_bin/"openlist", "server", "--data", etc/"openlist"]
    log_path var/"log/openlist/log.log"
    error_log_path var/"log/openlist/log.log"
    working_dir opt_prefix
    keep_alive true
  end

  def caveats
    <<~EOS
      [P] Patched version, re-added drivers:
        alist_v2, baidu_share, lark, trainbit, vtencent
      Drives not support in OpenList but in Alist:
        quqi
      To reveal openlist admin user's info in default `config.json` again, run the following command:
        cd #{opt_prefix} && openlist admin
      Or reveal password via `sqlite3` command:
        sqlite3 #{etc}/openlist/data.db "select password from x_users where username = 'admin'"
    EOS
  end

  test do
    test_port = 5244
    pid = fork do
      exec bin/"openlist", "server", "--data", testpath
    end
    sleep 3
    begin
      response = shell_output("curl -s http://localhost:#{test_port}")
      assert_match(/OpenList|openlist/i, response)
    ensure
      Process.kill("TERM", pid) if pid
      Process.wait(pid) if pid
    end
  end
end
