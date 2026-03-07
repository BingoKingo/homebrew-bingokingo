class OrgRuby < Formula
  desc "Org mode parser written in Ruby"
  homepage "https://github.com/wallyqs/org-ruby/"
  url "https://rubygems.org/downloads/org-ruby-0.9.12.gem"
  sha256 "93cbec3a4470cb9dca6a4a98dc276a6434ea9d9e7bc2d42ea33c3aedd5d1c974"
  license "MIT"
  head "https://github.com/wallyqs/org-ruby.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "6a9989a364a8d7580d9bc7eb8bd214ecc27dedaeb0f3b997bdd2d41488758f49"
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
    output = shell_output("#{bin}/org-ruby -h")
    assert_match "Usage", output
    version_output = shell_output("#{bin}/org-ruby -v")
    assert_match version.to_s, version_output
  end
end
