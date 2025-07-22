# [O] This repository has been archived by the owner on Feb 17, 2023. It is now read-only.
class TtsServerGo < Formula
  desc "微软TTS服务转发，以便在阅读APP中通过网络导入方式收听微软TTS Edge大声朗读"
  homepage "https://github.com/jing332/tts-server-go/"
  url "https://github.com/jing332/tts-server-go/archive/refs/tags/tts-server_v0.1.9.tar.gz"
  sha256 "8d6ddd36d92e56a7dd1383c449feb8eebadfaa92197d19148887631e625c21f4"
  head "https://github.com/jing332/tts-server-go.git", btanch: "master"

  livecheck do
    skip
  end

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
