class Md2key < Formula
  desc "Convert markdown to keynote"
  homepage "https://github.com/k0kubun/md2key/"
  url "https://rubygems.org/downloads/md2key-0.10.1.gem"
  sha256 "f6498dec0c8d1b7cbb00d2f1e8402cd03ed41ce374892314342a8be517359006"
  license "MIT"
  head "https://github.com/k0kubun/md2key.git", branch: "master"

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
    system "md2key", "help"
  end
end
