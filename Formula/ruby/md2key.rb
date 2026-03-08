class Md2key < Formula
  desc "Convert markdown to keynote"
  homepage "https://github.com/k0kubun/md2key/"
  url "https://rubygems.org/downloads/md2key-0.10.2.gem"
  sha256 "6dd86e14ac197d1e04083975d5bd9febb7fea041b104f50d1bc55ae5f250f652"
  license "MIT"
  head "https://github.com/k0kubun/md2key.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any,                 arm64_tahoe:   "7085fc22512d7be697b063f005e1832d0817c02efedc07089dfa53ac1f762cd8"
    sha256 cellar: :any,                 arm64_sequoia: "fd6b5c69ab8fe1abcff29f7e6080042a7d555ba89061c698c84b7b805c7068ca"
    sha256 cellar: :any,                 arm64_sonoma:  "61410c85566f8911447d7083ae5ec51046cdc2d2b9a807cf6228e33a6969fe6f"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "5d87460b80ba8be25b9546bc384b4d9b8eea4d8a486857ff7ac181481341abd2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1524ded3ff91d10e7cdb98d8a13c94994717249ef90f4df29bbbf69ce5dbb999"
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
    system bin/"md2key", "help"
  end
end
