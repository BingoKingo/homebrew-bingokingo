class AklYoudaoServer < Formula
  desc "有道翻译免秘钥免费查单词查句子服务启动方式"
  homepage "https://github.com/akl7777777/bob-plugin-akl-youdao-free-translate/"
  url "https://github.com/akl7777777/bob-plugin-akl-youdao-free-translate/archive/refs/tags/v_#{version}.tar.gz"
  version "0.0.8"

  if OS.mac?
    url "https://github.com/akl7777777/bob-plugin-akl-youdao-free-translate/releases/download/v_#{version}/youdaoTranslateServer_macos_x86_64"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/akl7777777/bob-plugin-akl-youdao-free-translate/releases/download/v_#{version}/youdaoTranslateServer_linux_x86_64"
  end

  livecheck do
    skip
  end

  def install
    if OS.mac?
      bin.install "youdaoTranslateServer_macos_x86_64" => "akl-youdao"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "youdaoTranslateServer_linux_x86_64" => "akl-youdao"
    end
  end

  service do
    run [opt_bin/"akl-youdao"]
    keep_alive true
  end

  test do
    system opt_bin/"akl-youdao"
  end
end
