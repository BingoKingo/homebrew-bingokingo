class Review < Formula
  desc "Digital publishing system for books and ebooks"
  homepage "https://github.com/kmuto/review/"
  url "https://rubygems.org/downloads/review-5.10.0.gem"
  sha256 "49e5c32d677c6fe54052330fd687b08f8e7863ff0e8b9cb68bb134bba7591b8f"
  license "LGPL-2.1-or-later"
  head "https://github.com/kmuto/review.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "53ea4f8022f6560814f9fdaa0a0978b8dd2456ec68dc1aca11b10e685e6e94fb"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "53ea4f8022f6560814f9fdaa0a0978b8dd2456ec68dc1aca11b10e685e6e94fb"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "53ea4f8022f6560814f9fdaa0a0978b8dd2456ec68dc1aca11b10e685e6e94fb"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "46dde80db152b9563fad925d23302bf7d7a2c4daa0f453444dd1108b302803d6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "46dde80db152b9563fad925d23302bf7d7a2c4daa0f453444dd1108b302803d6"
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
    system bin/"review", "--help"
  end
end
