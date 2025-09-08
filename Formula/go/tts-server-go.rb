class TtsServerGo < Formula
  desc "微软TTS服务转发在阅读APP中通过网络导入方式收听微软TTS Edge大声朗读"
  homepage "https://github.com/jing332/tts-server-go/"
  url "https://github.com/jing332/tts-server-go/archive/refs/tags/tts-server_v0.1.9.tar.gz"
  sha256 "8d6ddd36d92e56a7dd1383c449feb8eebadfaa92197d19148887631e625c21f4"
  head "https://github.com/jing332/tts-server-go.git", branch: "master"

  livecheck do
    skip
  end

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "954fb989a08131dd7c92cc9648a955f3d9ce4a9196189a775da0735941bc662c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "15647218bec2248db53fb27a9cbda241c898746eafbff76dd2a465e2b53a0747"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "fe47c42ccdcfff986e4cb84f0f32e98aadfe919cffc7c2a28689ac037da480cc"
    sha256 cellar: :any_skip_relocation, ventura:       "6582bd2f1c8efba100ec5197668fdfe6201e42b4ecc4f9c60cc37a43681729ab"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "c57fe7a7ec94b9ce57e50405e690ec0dbc043a0b87793174bd2786bae36c5562"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "4accdbb0e1a178958e7ab40499097ab4aeab450ea6a95fcb26ed3faa764cce19"
  end

  deprecate! date: "2023-02-17", because: :discontinued
  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/cli"
  end

  service do
    run [opt_bin/"tts-server-go"]
    keep_alive true
  end

  test do
    system bin/"tts-server-go", "--help"
    port = 1233
    pid = fork do
      exec bin/"tts-server-go", "-port", port.to_s
    end
    sleep 3
    begin
      require "socket"
      TCPSocket.new("localhost", port).close
    end
    Process.kill("TERM", pid)
    Process.wait(pid)
  end
end
