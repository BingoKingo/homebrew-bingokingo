class SimpreadSync < Formula
  desc "简悦 · 同步助手 · 命令行 · 伪"
  homepage "https://github.com/j1g5awi/simpread-sync"
  url "https://github.com/j1g5awi/simpread-sync/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "b999ce10914bb4de32dec197a0ea68b77d5daa130abfc85187fe4b52343e49f9"
  license "MIT"
  head "https://github.com/j1g5awi/simpread-sync.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  def post_install
    File.write etc/"simpread-sync-config.json", <<~EOS
      {
          "port": 7026,
          "syncPath": "~/SimpRead/sync",
          "outputPath": "~/SimpRead/output",
          "mailTitle": "SimpRead - {{title}}",
          "smtpHost": "",
          "smtpPort": 465,
          "smtpUsername": "",
          "smtpPassword": "",
          "receiverMail": "",
          "kindleMail": "",
          "autoRemove": "false",
          "enhancedOutput": [
              {"extension":"external", "path":"~/SimpRead/publish-demo/api/_output"},
              {"extension":"pdf", "path":"~/SimpRead/pdf"},
              {"extension":"epub", "path":"~/SimpRead/epub"},
              {"extension":"docx", "path":"~/SimpRead/docx"},
              {"extension":"assets", "path":"~/SimpRead/assets"},
              {"extension":"textbundle", "path":"~/SimpRead/textbundle"},
              {"extension":"md", "path":"~/SimpRead/md"}
          ]
      }
    EOS
  end

  service do
    run [opt_bin/"simpread-sync", "-c", "#{etc}/simpread-sync-config.json"]
    keep_alive true
  end

  def caveats
    <<~EOS
      See the difference between Simpread Sync desktop app and this cli here:
      https://github.com/Kenshin/simpread/discussions/3704
    EOS
  end

  test do
    system bin/"simpread-sync", "--version"
  end
end
