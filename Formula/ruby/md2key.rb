class Md2key < Formula
  desc "Convert markdown to keynote"
  homepage "https://github.com/k0kubun/md2key/"
  url "https://rubygems.org/downloads/md2key-0.10.2.gem"
  sha256 "6dd86e14ac197d1e04083975d5bd9febb7fea041b104f50d1bc55ae5f250f652"
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
    system bin/"md2key", "help"
  end
end
