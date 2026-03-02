class Ctrtool < Formula
  desc "General purpose reading/extraction tool for Nintendo 3DS file formats"
  homepage "https://github.com/3DSGuy/Project_CTR/"
  url "https://github.com/3DSGuy/Project_CTR/archive/refs/tags/ctrtool-v1.3.0.tar.gz"
  sha256 "6c0314928dea722f769cfa7257a963df0d7503962b2998a8c91ec6879fb86075"
  license "MIT"
  head "https://github.com/3DSGuy/Project_CTR.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "f216568e78899165ceb5c028b08f50c1cd23868e2052ce30bd2416fc26215f1f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "29924f5747273abc7835386f6d2d7a37ef327ea2ea9783a8a8aeda401e792902"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "343d72807afc367f809c99356244a46eaebf33f0377ebab92d62221c508467f2"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "0ab3600be7e9acfad56c87fb8f3a478352782e743a6cdabcf0944636f3e72e21"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f3c427bf8b637152ff9aaea93e8c70736de5933bbd073a819a2858b642a17743"
  end

  def install
    cd "ctrtool" do
      system "make", "deps"
      system "make"
      bin.install "bin/ctrtool"
    end
    cd "makerom" do
      system "make", "deps"
      system "make"
      bin.install "bin/makerom"
    end
  end

  def caveats
    <<~EOS
      [M] Modified from
      https://github.com/mistydemeo/homebrew-formulae/blob/master/Formula/ctrtool.rb
    EOS
  end

  test do
    makerom_help_output = shell_output("#{bin}/makerom -help", 254)
    assert_match(/Usage:/i, makerom_help_output)

    ctrtool_help_output = shell_output("#{bin}/ctrtool -h 2>&1", 1)
    assert_match("CTRTool v#{version} (C) jakcron", ctrtool_help_output)
    assert_match(/Usage:/i, ctrtool_help_output)
  end
end
