class Adflib < Formula
  desc "Free, portable and open implementation of the Amiga filesystem"
  homepage "https://github.com/adflib/ADFlib/"
  url "https://github.com/adflib/ADFlib/archive/refs/tags/v0.10.5.tar.gz"
  sha256 "e7e67970cf07f3dda08edce0b2f395eda82c2bf24c95b357ef295f1ec7ec48d3"
  license any_of: ["LGPL-2.1-or-later", "GPL-2.0-or-later"]
  head "https://github.com/adflib/ADFlib.git", branch: "master"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkgconf" => :build

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
    assert_match "Usage", shell_output("#{bin}/unadf -h")
    assert_match version.to_s, shell_output("#{bin}/unadf -V")
  end
end
