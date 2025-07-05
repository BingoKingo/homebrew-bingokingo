class Sparkr < Formula
  desc "ASCII Sparklines in Ruby"
  homepage "http://trivelop.de/sparkr/"
  url "https://rubygems.org/downloads/sparkr-0.4.1.gem"
  sha256 "2816acce87e6f8da783976c0e0d7b0f93c8d67a9fe28e1f15f14133bb22c56b7"
  license "MIT"
  head "https://github.com/rrrene/sparkr.git", branch: "master"

  depends_on "ruby"
  # uses_from_macos "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "bundle", "install", "-without", "development", "test" if build.head?
    system "gem", "build", "#{name}.gemspec" if build.head?
    system "gem", "install", "#{name}-#{version}.gem"
    bin.install libexec/"bin/#{name}"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    system bin/"sparkr", "-h"
  end
end
