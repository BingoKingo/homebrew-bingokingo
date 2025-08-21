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
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "37abbf79744c62ad5c0b71ab071670cac207a452e4ef5e5ead9b21214d68f7f4"
    sha256 cellar: :any_skip_relocation, arm64_linux: "be27b083a4139af87ac579af7276944b5a28c991aef7a54a5840c458f675898c"
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
    system bin/"tts-server-go"
  end
end
