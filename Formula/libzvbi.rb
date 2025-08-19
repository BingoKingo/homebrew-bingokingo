class Libzvbi < Formula
  desc "Vertical Blanking Interval (VBI) utilities"
  homepage "https://github.com/zapping-vbi/zvbi/"
  url "https://github.com/zapping-vbi/zvbi/archive/refs/tags/v0.2.44.tar.gz"
  sha256 "bca620ab670328ad732d161e4ce8d9d9fc832533cb7440e98c50e112b805ac5e"
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

  def caveats
    <<~EOS
      [M] Modified from
      https://github.com/afinne/homebrew-ffmpeg-with-zvbi/blob/master/zvbi.rb
    EOS
  end
  test do
    system bin/"zvbi-ntsc-cc", "-h"
  end
end
