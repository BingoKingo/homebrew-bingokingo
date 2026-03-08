class Libzvbi < Formula
  desc "Vertical Blanking Interval (VBI) utilities"
  homepage "https://github.com/zapping-vbi/zvbi/"
  url "https://github.com/zapping-vbi/zvbi/archive/refs/tags/v0.2.44.tar.gz"
  sha256 "bca620ab670328ad732d161e4ce8d9d9fc832533cb7440e98c50e112b805ac5e"
  head "https://github.com/zapping-vbi/zvbi.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 arm64_tahoe:   "e809e1b54342ca904322176b1444cb78d3f659528e6b31d40e3345af4278ad25"
    sha256 arm64_sequoia: "e734beec5b23f3d58a9915d2af448d0a78ccd340fc2602c714d8df9bdc6c601e"
    sha256 arm64_sonoma:  "a15d2ac0b415b81c46fdce084993eaa7da2680f85fa3b6b994bc97503b342f4a"
    sha256 arm64_linux:   "e79a8027a4c82d46e4f6641eb0b91bd64da919f872c2a327506bde4649736087"
    sha256 x86_64_linux:  "20055b30e4e4ac60373d9b0d35f49f5fe3e92f25b3398940ed8a86aeafa87e4b"
  end

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
