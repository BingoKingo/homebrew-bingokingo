class SimpreadSync < Formula
  desc "简悦 · 同步助手 · 命令行 · 伪"
  homepage "https://github.com/j1g5awi/simpread-sync"
  url "https://github.com/j1g5awi/simpread-sync/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "b999ce10914bb4de32dec197a0ea68b77d5daa130abfc85187fe4b52343e49f9"
  license "MIT"
  head "https://github.com/j1g5awi/simpread-sync.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "35bec0e332dfee7d9b5747711839819e9b06f3b96d8aa25865f6f37fe96c2b29"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "9414182186d150970f469efe8df68f1f380599be4dce9c9efcaaae4e6e96bd5b"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "c9d037cc57235b627d4706233ec127eb85be7321a85200c437c33168d2b6f702"
    sha256 cellar: :any_skip_relocation, ventura:       "4c37198a83698f0ffd6493fff49ad8b1c4e910df67381270d8a451620d8e82f7"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "0896e33f649185e47e00e7bbbce850a4251f69fde1282de523c46560edd82e61"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "06846b820486451f63be0df9f8affe1f77cba776d0bc95b7011268f9f242ca31"
  end

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
    assert_path_exists bin/"simpread-sync"
    assert_predicate bin/"simpread-sync", :executable?
  end
end
