class Avisynthplus < Formula
  desc "AviSynth headers for applications with improvements"
  homepage "https://github.com/AviSynth/AviSynthPlus/"
  url "https://github.com/AviSynth/AviSynthPlus/archive/refs/tags/v3.7.5.tar.gz"
  sha256 "2533fafe5b5a8eb9f14d84d89541252a5efd0839ef62b8ae98f40b9f34b3f3d5"
  head "https://github.com/AviSynth/AviSynthPlus.git", branch: "master"

  depends_on "cmake" => :build

  def install
    system "cmake", "-DHEADERS_ONLY:bool=on"
    system "make", "PREFIX=#{prefix}", "install"
  end
end
