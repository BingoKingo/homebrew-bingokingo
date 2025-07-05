# [M] Modified from https://github.com/afinne/homebrew-ffmpeg-with-zvbi/blob/master/zvbi.rb
class Libzvbi < Formula
  desc "Vertical Blanking Interval (VBI) utilities"
  homepage "https://github.com/zapping-vbi/zvbi/"
  url "https://github.com/zapping-vbi/zvbi/archive/refs/tags/v0.2.43.tar.gz"
  sha256 "437522d8d0906c43c0a51163f40a3a7e4c0f1f377c0d2d5f25c1b69c827fb3ed"
  head "https://github.com/zapping-vbi/zvbi.git", branch: "main"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "gettext" => :build
  depends_on "libtool" => :build

  def install
    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--without-x",
                          "--prefix=#{prefix}"
    system "make"
    # system "make", "check"
    system "make", "install"
  end

  test do
    system bin/"zvbi-ntsc-cc", "-h"
  end
end
