class Review < Formula
  desc "Digital publishing system for books and ebooks"
  homepage "https://github.com/kmuto/review/"
  url "https://rubygems.org/downloads/review-5.10.0.gem"
  sha256 "49e5c32d677c6fe54052330fd687b08f8e7863ff0e8b9cb68bb134bba7591b8f"
  license "LGPL-2.1"
  head "https://github.com/kmuto/review.git", branch: "master"

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
