class Dockerc < Formula
  desc "Container image to single executable compiler"
  homepage "https://github.com/NilsIrl/dockerc"
  url "https://github.com/NilsIrl/dockerc/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "e5b84489b51a89941f9fb899d6180f667a6e5a05f7eb3f1acd590d6073c4024a"
  license "GPL-3.0"
  head "https://github.com/NilsIrl/dockerc.git", branch: "trunk"

  depends_on "zig" => :build
  depends_on :linux

  def install
    system "zig", "build", *std_zig_args
  end

  test do
    system "false"
  end
end
