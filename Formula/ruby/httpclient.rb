class Httpclient < Formula
  desc "gives something like the functionality of libwww-perl (LWP) in Ruby"
  homepage "https://github.com/nahi/httpclient/"
  url "https://rubygems.org/downloads/httpclient-2.8.3.gem"
  sha256 "2951e4991214464c3e92107e46438527d23048e634f3aee91c719e0bdfaebda6"
  license "Ruby"
  head "https://github.com/nahi/httpclient.git", branch: "master"

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
    system bin/"httpclient"
  end
end
