class Docker2exe < Formula
  desc "Convert a Docker image to an executable"
  homepage "https://github.com/rzane/docker2exe/"
  url "https://github.com/rzane/docker2exe/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "a8520395ae763f1f8111e4faf4deb1b7652949c458efdd4b4d9502ad85bc0266"
  head "https://github.com/rzane/docker2exe.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "234441f131b676957075eb2e3eedc5155261c9d720e5397a3945a1e8494de503"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "234441f131b676957075eb2e3eedc5155261c9d720e5397a3945a1e8494de503"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "234441f131b676957075eb2e3eedc5155261c9d720e5397a3945a1e8494de503"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "bc6ee227555e8dd8f439b265f4b8a088e795b6ce474735df4fe6d8beb63a2a21"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e0f7702ffeb1f598ea340e002f67887f9e0c40e674317845f3e1c94ed39c036d"
  end

  depends_on "go" => :build
  depends_on "gzip"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/docker2exe -h")
  end
end
