# [M] Modified from https://github.com/barn/homebrew-misc/blob/main/adflib.rb
class Adflib < Formula
  desc "Free, portable and open implementation of the Amiga filesystem"
  homepage "https://github.com/lclevy/ADFlib/"
  url "https://github.com/lclevy/ADFlib/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "4fab44c4887a5016e2a42ec6fa29b6c2c9e5f9adf63fd1652cc4091fb964d54c"
  license "GPL"
  head "https://github.com/lclevy/ADFlib", branch: "master"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    args = []
    args += std_configure_args.reject { |s| s["--disable-debug"] || s["--disable-dependency-tracking"] }

    system "./autogen.sh"
    system "./configure", "--disable-silent-rules", *args
    system "make", "install"
  end

  test do
    system opt_bin/"unadf"
  end
end
