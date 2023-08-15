# [O] This repository has been archived by the owner on Feb 17, 2023. It is now read-only.
class TtsServerGo < Formula
  desc "微软TTS服务转发，以便在阅读APP中通过网络导入方式收听微软TTS Edge大声朗读"
  homepage "https://github.com/jing332/tts-server-go/"
  url "https://github.com/jing332/tts-server-go/archive/tts-server_v#{version}.tar.gz"
  version "0.1.9"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/jing332/tts-server-go/releases/download/tts-server_v#{version}/tts-server-go_darwin_arm64"
      sha256 "cb8b7094b9ab9537f6bd4ea05d18aa2950904c5deb35a44de385c5d69e11ed15"
    elsif Hardware::CPU.intel?
      url "https://github.com/jing332/tts-server-go/releases/download/tts-server_v#{version}/tts-server-go_darwin_amd64"
      sha256 "fa709b100b5f45eaf14a328ecd18d296c4929b6597a1d5e6f807daddae7e7c2b"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/jing332/tts-server-go/releases/download/tts-server_v#{version}/tts-server-go_linux_amd64"
    sha256 "94b1178000f9f51132be55b6da3f33353856758f57ff293282f79b10faa40796"
  end

  livecheck do
    skip
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
