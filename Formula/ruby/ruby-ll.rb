class RubyLl < Formula
  desc "LL(1) parser generator for Ruby"
  homepage "https://github.com/yorickpeterse/ruby-ll/"
  url "https://rubygems.org/downloads/ruby-ll-2.1.4.gem"
  sha256 "bec3a40078e4b8578b20751f0b2e3dc3fcaa773e34fae3d9725b724032e47e0c"
  license "MPL-2.0"
  head "https://github.com/yorickpeterse/ruby-ll.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any,                 arm64_tahoe:   "63956c706dad3a79f3236ae366f872468286472c94639b5dcf9270b9ef763b23"
    sha256 cellar: :any,                 arm64_sequoia: "b64c58b79282120c38d8dbd8e9a86c045f7a31e1b8b216116b3f0051a7fd4e84"
    sha256 cellar: :any,                 arm64_sonoma:  "c7ef7a10e5daa3bc5987b1b96f2eac332e71d72cffa701252ddd6ff0bcfeca38"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "74670661c79d149d7e71059170212bae8e721181008b5fc081cfae51983290c8"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "97708e9100800d82559927c82c4a51d7c7f2caa784521aa10e5e1796b015d195"
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
    output = shell_output("#{bin}/ruby-ll -h 2>&1", 1)
    assert_match "Usage", output
    assert_match "About", output
    assert_match "Generates a Ruby LL(1) parser from a ruby-ll compatible grammar file.", output
    assert_match "Examples", output
    assert_match "Options", output
    version_output = shell_output("#{bin}/ruby-ll -v 2>&1")
    assert_match "ruby-ll #{version}", version_output
  end
end
