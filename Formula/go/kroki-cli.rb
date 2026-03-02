class KrokiCli < Formula
  desc "Creates diagrams from textual descriptions in CLI"
  homepage "https://github.com/yuzutech/kroki-cli/"
  url "https://github.com/yuzutech/kroki-cli/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "f7b0fe1dd49eb5fe6d6cbc892e1e84d670d1a90f0c457c7c28e4201654da6c3e"
  license "MIT"
  head "https://github.com/yuzutech/kroki-cli.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e5d1de3db9363b24b19993a1a2bfa37b816c1d5b41418861204789fc3a892bfc"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "268f0ba4f5d2aa14bfce1defc408cacb59052d6454594cc67c3a61e25d94d301"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "74c83a541d57031311bef8ca3d1c35505f3ac4fd3a09b72407d152d8f4b742f8"
    sha256 cellar: :any_skip_relocation, ventura:       "03250d96350c5ce3468156ccb36d43f5874db614410fb466e8afb9193d1ada9f"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "1b2c03ec957bc483ac6db9e6b6cd63638a8fdc9a1cde54ba625052edf9df6f68"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "32183054c057495e2247e9d8cb0874223eb7fc561201ae561c72f7498d0f05e7"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/kroki"
  end

  test do
    assert_path_exists bin/"kroki-cli"
    assert_predicate bin/"kroki-cli", :executable?
  end
end
