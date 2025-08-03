class Thor < Formula
  desc "Toolkit for building powerful command-line interfaces"
  homepage "http://whatisthor.com/"
  url "https://rubygems.org/downloads/thor-1.4.0.gem"
  sha256 "8763e822ccb0f1d7bee88cde131b19a65606657b847cc7b7b4b82e772bcd8a3d"
  license "MIT"
  head "https://github.com/rails/thor.git", branch: "main"

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
