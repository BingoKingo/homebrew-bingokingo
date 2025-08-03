class KeepassDiff < Formula
  desc "Reads two Keepass (.kdbx) files and prints their differences"
  homepage "https://keepass-diff.narigo.dev/"
  url "https://github.com/Narigo/keepass-diff/archive/refs/tags/1.1.3.tar.gz"
  sha256 "4ddf872f126ee74cc4b44f7b6aabe516da9a4c0dee1466110ca9acec04079325"
  license "MIT"
  head "https://github.com/Narigo/keepass-diff.git", branch: "main"

  depends_on "rust" => :build
  depends_on "python@3.13"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"keepass-diff", "-h"
  end
end
