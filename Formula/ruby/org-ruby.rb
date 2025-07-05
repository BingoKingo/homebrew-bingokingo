class OrgRuby < Formula
  desc "Org mode parser written in Ruby"
  homepage "https://github.com/wallyqs/org-ruby/"
  url "https://rubygems.org/downloads/org-ruby-0.9.12.gem"
  sha256 "93cbec3a4470cb9dca6a4a98dc276a6434ea9d9e7bc2d42ea33c3aedd5d1c974"
  license "MIT"
  head "https://github.com/wallyqs/org-ruby.git", branch: "master"

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
    system bin/"org-ruby", "--help"
  end
end
