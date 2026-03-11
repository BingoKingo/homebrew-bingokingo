class Istats < Formula
  desc "Ruby gem for your mac stats"
  homepage "https://github.com/Chris911/iStats/"
  url "https://rubygems.org/downloads/iStats-1.6.2.gem"
  sha256 "cd7a805dd889613d5a2d92dcf03f956729eef119398106d18a33ee407b8d4b10"
  license "MIT"
  head "https://github.com/Chris911/iStats.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any, arm64_tahoe:   "7a9485484a6c0c2c7a5de6f181e1390b9fd110f865308257c637003259578782"
    sha256 cellar: :any, arm64_sequoia: "2449cc11098037d866d220b32abb1b6849377415047db476ba86e611ae24724f"
    sha256 cellar: :any, arm64_sonoma:  "e77fa50426e7a98f2e76971fa8181de6c0c5b32e2b90c19e895280489847b2be"
  end

  depends_on :macos
  depends_on "ruby"
  # uses_from_macos "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "bundle", "install", "-without", "development", "test" if build.head?
    system "gem", "build", "iStats.gemspec" if build.head?
    system "gem", "install", "iStats-#{version}.gem"
    bin.install libexec/"bin/iStats"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    output = shell_output("#{bin}/iStats --help 2>&1", 1)
    assert_match "iStats: help", output
    assert_match "Commands", output
    assert_match "Arguments", output
    version_output = shell_output("#{bin}/iStats --version 2>&1", 1)
    assert_match "iStats v#{version}", version_output
  end
end
