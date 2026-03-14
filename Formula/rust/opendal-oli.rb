class OpendalOli < Formula
  desc "OpenDAL Command-line Interface"
  homepage "https://opendal.apache.org/"
  url "https://static.crates.io/crates/oli/oli-0.41.21.crate"
  sha256 "400ab0eae258b9fb4f2f9de2cb4f6d06cdb555894ecdfd417e6a1180704ceb68"
  license "Apache-2.0"
  head "https://github.com/apache/opendal-oli.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "2e83eb4f9caad09b15afb3d060a4654c33ca0df5f59f751bb5a78ccd39899a61"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "013a76947ba5920eda129c0a672b61e7b1c95f5a9e991285eaf0228c5815debd"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "e1c68adce4f7a01435645c2380b2361ca8bf22bdc0fdda60b0dcab0c881f2b0d"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "0a71d5aa230cc01ae2dcc6456486bde3f7eef4b29e4eba58d107519c79b946e0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2952009eb838695d207bb463279a6b1cfae6c02a9f3e0ff089a7b2311bb4cf40"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/oli -h")
    assert_match "OpenDAL Command Line Interface", output
    assert_match "Usage", output
    assert_match "Commands", output
    assert_match "Options", output
    assert_match "oli #{version}", shell_output("#{bin}/oli -V")
  end
end
