class Sparkr < Formula
  desc "ASCII Sparklines in Ruby"
  homepage "https://trivelop.de/sparkr/"
  url "https://rubygems.org/downloads/sparkr-0.4.1.gem"
  sha256 "2816acce87e6f8da783976c0e0d7b0f93c8d67a9fe28e1f15f14133bb22c56b7"
  license "MIT"
  head "https://github.com/rrrene/sparkr.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "be0096fef9916eb1c6d711973704be36464f6f6e40ef28a94e58d6e80b5e6a43"
  end

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
