class Httpclient < Formula
  desc "Gives something like the functionality of libwww-perl (LWP) in Ruby"
  homepage "https://github.com/nahi/httpclient/"
  url "https://rubygems.org/downloads/httpclient-2.9.0.gem"
  sha256 "4b645958e494b2f86c2f8a2f304c959baa273a310e77a2931ddb986d83e498c8"
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
