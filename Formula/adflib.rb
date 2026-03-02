class Adflib < Formula
  desc "Free, portable and open implementation of the Amiga filesystem"
  homepage "https://github.com/adflib/ADFlib/"
  url "https://github.com/adflib/ADFlib/archive/refs/tags/v0.10.5.tar.gz"
  sha256 "e7e67970cf07f3dda08edce0b2f395eda82c2bf24c95b357ef295f1ec7ec48d3"
  license any_of: ["LGPL-2.1-or-later", "GPL-2.0-or-later"]
  head "https://github.com/adflib/ADFlib.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any,                 arm64_tahoe:   "dffb4ccf34ef85403e9e8ae0d968c634d0e07fdb1271c729153bcafe23917263"
    sha256 cellar: :any,                 arm64_sequoia: "1ebca60ff3ec7c92bc52f6154c8011b68b5eca63dbc637496b635af2deac37bf"
    sha256 cellar: :any,                 arm64_sonoma:  "99663131c3412e6c34df1147149feff6b19f764660258bbd6e1223756275649b"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "309b6a5b81646fb98111b5fbc50b86b401f46d4ed2fffc114e3157db122c4b79"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "9cd01f6bdf324363749c1b9fce7435361febeaf3136ab1354e213fb575e17880"
  end

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
