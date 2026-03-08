class Thor < Formula
  desc "Toolkit for building powerful command-line interfaces"
  homepage "https://whatisthor.com/"
  url "https://rubygems.org/downloads/thor-1.5.0.gem"
  sha256 "e3a9e55fe857e44859ce104a84675ab6e8cd59c650a49106a05f55f136425e73"
  license "MIT"
  head "https://github.com/rails/thor.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "b9ac0dfa72f29271e54ce3beb3a1af14f212f994f8cc21c2e06503500595f1e5"
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
    system bin/"thor", "help"
  end
end
