class Adflib < Formula
  desc "Free, portable and open implementation of the Amiga filesystem"
  homepage "https://github.com/lclevy/ADFlib/"
  url "https://github.com/lclevy/ADFlib/archive/refs/tags/v0.10.2.tar.gz"
  sha256 "1181cda574fcc87ba6564d519ecf58f63fbc468e0bd408485471ffa2e9745c5c"
  license any_of: ["LGPL-2.1-or-later", "GPL-2.0-or-later"]
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

  def caveats
    <<~EOS
      [M] Modified from
      https://github.com/barn/homebrew-misc/blob/main/adflib.rb
    EOS
  end
  test do
    system bin/"unadf"
  end
end
