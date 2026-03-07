class Bbdown < Formula
  desc "Bilibili Downloader CLI"
  homepage "https://github.com/nilaoda/BBDown/"
  url "https://github.com/nilaoda/BBDown/archive/refs/tags/1.6.3.tar.gz"
  sha256 "b0bd145354327749f9a7293c94dd385eecbbe6118ca7fa93d56e56f2deabaa85"
  license "MIT"
  head "https://github.com/nilaoda/BBDown.git", branch: "master"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "ee8a312af44fa463a15ba1bd1bb217d585bd33ca62966f208b50df813b8a5dfb"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9411cbd4950fb347feb75ea4293de4dd5216849b2072a89cf5f5e34af137f662"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "1f274a97640f853a6ef1b85a8528cc4ed0320a1260cc4b444cf73243797a797a"
  end

  depends_on "protobuf" => :build
  depends_on "dotnet"

  def install
    system "dotnet", "publish", "BBDown", "-c", "Release", "-o", libexec.to_s
    bin.install libexec/"BBDown"
  end

  test do
    output = shell_output("#{bin}/BBDown --help")
    assert_match "BBDown version #{version}, Bilibili Downloader.", output
    assert_match "Description", output
    assert_match "Usage", output
    assert_match "Arguments", output
    assert_match "Options", output
    assert_match "Commands", output
  end
end
