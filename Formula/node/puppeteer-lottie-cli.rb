class PuppeteerLottieCli < Formula
  desc "Rendering Lottie animations via Puppeteer to image, GIF, or MP4"
  homepage "https://github.com/transitive-bullshit/puppeteer-lottie-cli/"
  url "https://registry.npmjs.org/puppeteer-lottie-cli/-/puppeteer-lottie-cli-1.0.9.tgz"
  sha256 "7d954c4b91019a83a2251ae5873ecedad93b80cdbe6b915194a4dd7685526813"
  license "MIT"
  head "https://github.com/transitive-bullshit/puppeteer-lottie-cli.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, all: "a2c5234163ae1394a9ca35bb3663e57926c4deaae1be8ed6731d55e64fadc185"
  end

  depends_on "node"

  def install
    system "npm", "i", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"puppeteer-lottie"
  end
end
