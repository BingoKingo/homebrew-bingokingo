class AklMsttsServer < Formula
  desc "微软语音tts免费免秘钥bob插件后台服务"
  homepage "https://github.com/akl7777777/bob-plugin-akl-microsoft-free-tts/"
  url "https://github.com/akl7777777/bob-plugin-akl-microsoft-free-tts/archive/refs/tags/v#{version}.tar.gz"
  version "0.0.9"

  if OS.mac?
    url "https://github.com/akl7777777/bob-plugin-akl-microsoft-free-tts/releases/download/v#{version}/mstts_server_MacOS"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/akl7777777/bob-plugin-akl-microsoft-free-tts/releases/download/v#{version}/mstts_server_linux"
  end

  livecheck do
    skip
  end

  def install
    if OS.mac?
      bin.install "mstts_server_MacOS" => "akl-mstts"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "mstts_server_linux" => "akl-mstts"
    end
  end

  service do
    run [opt_bin/"akl-mstts"]
    keep_alive true
    launch_only_once true
  end

  test do
    system opt_bin/"akl-mstts"
  end
end
