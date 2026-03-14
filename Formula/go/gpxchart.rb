class Gpxchart < Formula
  desc "Command-line tool and library for elevation charts from GPX files"
  homepage "https://github.com/tkrajina/gpxchart/"
  url "https://github.com/tkrajina/gpxchart/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "e2451758a3ef7ea6e601105d9964d8057112047fc4cabbe802a6c943dbfe79b3"
  license "Apache-2.0"
  head "https://github.com/tkrajina/gpxchart.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "eb36c1ce31b7efde4024637d2fd71bc2f0f33e81e8173b1dfa050b7eb14d16f4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "eb36c1ce31b7efde4024637d2fd71bc2f0f33e81e8173b1dfa050b7eb14d16f4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "eb36c1ce31b7efde4024637d2fd71bc2f0f33e81e8173b1dfa050b7eb14d16f4"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "9cc619504bf4c957fa5ffc01667d24e731b01eb40738836138eee6edf4497ec4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3ec8e7a4e34e4df0e56712d71fb1f76cb6dba5d2399de7297d31ed1b80210e51"
  end

  depends_on "go" => :build

  def install
    cd "cmd/gpxchart" do
      system "go", "build", *std_go_args(ldflags: "-s -w")
    end
  end

  test do
    output = shell_output("#{bin}/gpxchart --help")
    assert_match "gpxchart [options] in_file.gpx out_file.png", output
    assert_match "gpxchart [options] in_file.gpx out_file.svg", output
  end
end
