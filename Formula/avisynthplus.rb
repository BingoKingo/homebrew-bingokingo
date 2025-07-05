class Avisynthplus < Formula
  desc "AviSynth headers for applications with improvements"
  homepage "https://github.com/AviSynth/AviSynthPlus/"
  url "https://github.com/AviSynth/AviSynthPlus/archive/refs/tags/v3.7.3.tar.gz"
  sha256 "b847705af6f16fa26664d06e0fea2bda14a7f6aac8249a9c37e4106ecb8fd44c"
  head "https://github.com/AviSynth/AviSynthPlus.git", branch: "main"

  depends_on "cmake" => :build

  def install
    system "cmake", "-DHEADERS_ONLY:bool=on"
    system "make", "PREFIX=#{prefix}", "install"
  end
end
