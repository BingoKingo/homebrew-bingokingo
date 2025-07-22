class Gpxchart < Formula
  desc "Command-line tool and library for elevation charts from GPX files"
  homepage "https://github.com/tkrajina/gpxchart/"
  url "https://github.com/tkrajina/gpxchart/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "e2451758a3ef7ea6e601105d9964d8057112047fc4cabbe802a6c943dbfe79b3"
  license "Apache-2.0"
  head "https://github.com/tkrajina/gpxchart.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system bin/"gpxchart", "--help"
  end
end
