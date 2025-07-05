class RubyLl < Formula
  desc "LL(1) parser generator for Ruby"
  homepage "https://github.com/yorickpeterse/ruby-ll/"
  url "https://rubygems.org/downloads/ruby-ll-2.1.3.gem"
  sha256 "312402d06ffe2a116c18d3559c2e3d3f05a7e1147cd0c837a82a156b26cd917a"
  license "MPL-2.0"
  head "https://github.com/yorickpeterse/ruby-ll", branch: "main"

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
