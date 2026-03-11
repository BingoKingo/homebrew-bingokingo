class Jekyll < Formula
  desc "Blog-aware static site generator in Ruby"
  homepage "https://jekyllrb.com/"
  url "https://rubygems.org/downloads/jekyll-4.4.1.gem"
  sha256 "4c1144d857a5b2b80d45b8cf5138289579a9f8136aadfa6dd684b31fe2bc18c1"
  license "MIT"
  head "https://github.com/jekyll/jekyll.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any, arm64_tahoe:   "fc22c83ed64cd2c7d7ce3e974abf152cf626614fc3e2be95c427ab2e9b4ba05b"
    sha256 cellar: :any, arm64_sequoia: "a29cf93f5f5e2c1b397b7a729accfc68dec374d9115897254ff0e98e0399fa56"
    sha256 cellar: :any, arm64_sonoma:  "3ac6dd6f94b850f78358afce22f8d4addceae5b6de764db50220a7abdf449a76"
  end

  depends_on "ruby"
  # uses_from_macos "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    ENV["GEM_PATH"] = libexec
    ENV["SDKROOT"] = MacOS.sdk_path if MacOS.sdk_path
    ENV["PATH"] = "#{HOMEBREW_PREFIX}/bin:#{HOMEBREW_PREFIX}/sbin:#{ENV["PATH"]}"
    ENV["RUBYOPT"] = ""
    ENV["MACOSX_DEPLOYMENT_TARGET"] = MacOS.version.to_s
    system "bundle", "install", "-without", "development", "test" if build.head?
    system "gem", "build", "#{name}.gemspec" if build.head?
    system "gem", "install", "#{name}-#{version}.gem"
    bin.install libexec/"bin/#{name}"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  def post_install
    # Remove sass-embedded snapshot to avoid flat namespace warnings
    sass_embedded_dir = Dir["#{libexec}/gems/sass-embedded-*/lib/sass/dart-sass/src/sass.snapshot"]
    File.delete(sass_embedded_dir[0]) if sass_embedded_dir.any?
  end

  test do
    output = shell_output("#{bin}/jekyll -h")
    assert_match "jekyll #{version} -- Jekyll is a blog-aware, static site generator in Ruby", output
    assert_match "Usage", output
    assert_match "Options", output
    assert_match "Subcommands", output
    version_output = shell_output("#{bin}/jekyll -v")
    assert_match "jekyll #{version}", version_output
  end
end
