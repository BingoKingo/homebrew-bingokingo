class TtsServerGo < Formula
  desc "微软TTS服务转发，以便在阅读APP中通过网络导入方式收听微软TTS Edge大声朗读"
  homepage "https://github.com/jing332/tts-server-go/"
  url "https://github.com/jing332/tts-server-go/archive/refs/tags/tts-server_v#{version}.tar.gz"
  version "0.1.9"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/jing332/tts-server-go/releases/download/tts-server_v#{version}/tts-server-go_darwin_arm64"
    elsif Hardware::CPU.intel?
      url "https://github.com/jing332/tts-server-go/releases/download/tts-server_v#{version}/tts-server-go_darwin_amd64"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/jing332/tts-server-go/releases/download/tts-server_v#{version}/tts-server-go_linux_amd64"
  end

  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "tts-server-go_darwin_arm64" => "tts-server-go"
      elsif Hardware::CPU.intel?
        bin.install "tts-server-go_darwin_amd64" => "tts-server-go"
      end
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "tts-server-go_linux_amd64" => "tts-server-go"
    end
  end

  service do
    run [opt_bin/"tts-server-go"]
    keep_alive true
  end

  test do
    system opt_bin/"tts-server-go"
  end
end
