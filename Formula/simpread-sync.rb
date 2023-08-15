class SimpreadSync < Formula
  desc "简悦 · 同步助手 · 命令行 · 伪"
  homepage "https://github.com/j1g5awi/simpread-sync/"
  url "https://github.com/j1g5awi/simpread-sync/archive/v#{version}.tar.gz"
  version "0.8.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/j1g5awi/simpread-sync/releases/download/v#{version}/simpread-sync_darwin_arm64.tar.gz"
      sha256 "00d08a59a25bf52e48ac9defa03c75f470665b858fb6d4db003ca2a7ec285434"
    elsif Hardware::CPU.intel?
      url "https://github.com/j1g5awi/simpread-sync/releases/download/v#{version}/simpread-sync_darwin_amd64.tar.gz"
      sha256 "689e50f312675e16b6738293092291df6d9da1e89d2b321a5aa4efda8dc4fcc4"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/j1g5awi/simpread-sync/releases/download/v#{version}/simpread-sync_linux_amd64.tar.gz"
    sha256 "643d69fe695f21064698f46f62c26e0d90f5ed72fed4634dab1ef1a545107660"
  end

  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    prefix.install Dir["*"]
    bin.install prefix/"simpread-sync"
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
