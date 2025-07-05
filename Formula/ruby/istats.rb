class Istats < Formula
  desc "Ruby gem for your mac stats"
  homepage "https://github.com/Chris911/iStats/"
  url "https://rubygems.org/downloads/iStats-1.6.2.gem"
  sha256 "cd7a805dd889613d5a2d92dcf03f956729eef119398106d18a33ee407b8d4b10"
  license "MIT"
  head "https://github.com/Chris911/iStats.git", branch: "master"

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
    system bin/"istats", "--help"
  end
end
