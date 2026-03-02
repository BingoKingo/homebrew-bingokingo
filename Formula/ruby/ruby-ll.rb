class RubyLl < Formula
  desc "LL(1) parser generator for Ruby"
  homepage "https://github.com/yorickpeterse/ruby-ll/"
  url "https://rubygems.org/downloads/ruby-ll-2.1.4.gem"
  sha256 "bec3a40078e4b8578b20751f0b2e3dc3fcaa773e34fae3d9725b724032e47e0c"
  license "MPL-2.0"
  head "https://github.com/yorickpeterse/ruby-ll.git", branch: "main"

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
    system bin/"ruby-ll"
  end
end
