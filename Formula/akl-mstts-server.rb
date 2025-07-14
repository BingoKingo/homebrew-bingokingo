# [O] Outdated and not supported, more details from https://github.com/akl7777777/bob-plugin-akl-microsoft-free-tts/issues/2
class AklMsttsServer < Formula
  desc "微软语音tts免费免秘钥bob插件后台服务"
  homepage "https://github.com/akl7777777/bob-plugin-akl-microsoft-free-tts/"
  url "https://github.com/akl7777777/bob-plugin-akl-microsoft-free-tts/archive/v#{version}.tar.gz"
  version "0.0.9"

  if OS.mac?
    url "https://github.com/akl7777777/bob-plugin-akl-microsoft-free-tts/releases/download/v#{version}/mstts_server_MacOS"
    sha256 "6ac4563fd25d406616e22d2b5a54344dcc8d87afadbd473ec2db3a7417dcb167"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/akl7777777/bob-plugin-akl-microsoft-free-tts/releases/download/v#{version}/mstts_server_linux"
    sha256 "64b6a26d860b0dee133f5f2a69bcebfa0e73c9cb618d32e84f91cd8d72581ce5"
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
    system bin/"akl-mstts"
  end
end
