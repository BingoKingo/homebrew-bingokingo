class KeepassDiff < Formula
  desc "Reads two Keepass (.kdbx) files and prints their differences"
  homepage "https://keepass-diff.narigo.dev/"
  url "https://github.com/Narigo/keepass-diff/archive/refs/tags/1.1.3.tar.gz"
  sha256 "4ddf872f126ee74cc4b44f7b6aabe516da9a4c0dee1466110ca9acec04079325"
  license "MIT"
  head "https://github.com/Narigo/keepass-diff.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "541fe6acaa9aecd52b8244e50b0c488b178d5dfac2d231cf4558eeff8bbd0fab"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6f12a43c187b4f27b86d8910a362ac185e99cf83dcd5e1ca6f7e9fc01c8d0ef5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "6c06eb80e629b4d224941e82c06dad54daf19efc5c1496cf6ebd31171eb66609"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "d7047398bdd37997add5bbfebccb1a802a6a54d1a63c2e75ee20537b8b6606ed"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5ba114c9697e1aecc13ad21d53a1e67feef04fd789cafed53ba935b3a2f23557"
  end

  depends_on "rust" => :build
  depends_on "python@3.14"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/keepass-diff -h")
    assert_match "keepass-diff #{version}", output
    assert_match "USAGE", output
    assert_match "ARGS", output
    assert_match "OPTIONS", output
    version_output = shell_output("#{bin}/keepass-diff -V")
    assert_match "keepass-diff #{version}", version_output
  end
end
