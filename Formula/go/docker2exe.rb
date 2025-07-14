class Docker2exe < Formula
  desc "Convert a Docker image to an executable"
  homepage "https://github.com/rzane/docker2exe/"
  url "https://github.com/rzane/docker2exe/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "a8520395ae763f1f8111e4faf4deb1b7652949c458efdd4b4d9502ad85bc0266"
  head "https://github.com/rzane/docker2exe.git", branch: "master"

  depends_on "go" => :build
  depends_on "gzip"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system bin/"docker2exe", "--help"
  end
end
