class AklYoudaoServer < Formula
  desc "有道翻译免秘钥免费查单词查句子服务启动方式"
  homepage "https://github.com/akl7777777/bob-plugin-akl-youdao-free-translate/"
  url "https://github.com/akl7777777/bob-plugin-akl-youdao-free-translate/archive/refs/heads/v_#{version}.tar.gz"
  version "0.0.8"

  if OS.mac?
    url "https://github.com/akl7777777/bob-plugin-akl-youdao-free-translate/releases/download/v_#{version}/youdaoTranslateServer_macos_x86_64"
    sha256 "94894540fbaac3f661a7cfe06a1a1847ab8431fc2414f3331b6d60ae20ee1abf"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/akl7777777/bob-plugin-akl-youdao-free-translate/releases/download/v_#{version}/youdaoTranslateServer_linux_x86_64"
    sha256 "948e198c28dac228ec0b514072c2493742b883023a5b07e2d83a5f9897f205ba"
  end
  livecheck do
    skip
  end

  deprecate! date: "2023-04-05", because: :discontinued
  def install
    if OS.mac?
      bin.install "youdaoTranslateServer_macos_x86_64" => "akl-youdao"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "youdaoTranslateServer_linux_x86_64" => "akl-youdao"
    end
  end

  def caveats
    <<~EOS
      \033[1m[O]\033[0m Not longer needed, more details from
      https://github.com/akl7777777/bob-plugin-akl-microsoft-free-tts/issues/2
    EOS
  end

  service do
    run [opt_bin/"akl-youdao"]
    keep_alive true
  end

  test do
    system bin/"akl-youdao"
  end
end
