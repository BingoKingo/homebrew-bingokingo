class Ctrtool < Formula
  desc "General purpose reading/extraction tool for Nintendo 3DS file formats"
  homepage "https://github.com/3DSGuy/Project_CTR/"
  url "https://github.com/3DSGuy/Project_CTR/archive/refs/tags/ctrtool-v1.2.1.tar.gz"
  sha256 "8ad69c2abd3b51ea9a27999052f2b932a6dfd29dce66904eac2ea0391c0bbe2f"
  license "MIT"
  head "https://github.com/3DSGuy/Project_CTR.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e0e1113a8e1a739ffb0f1cddba5fa96c2c9638799f9ea753427d67caf53c98f7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "9e075acd24d95feca9383ccf314cccf21a80655134dc9fa779a3b7f94cec7fe4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "4faebaa9b08936cfac29f6b57804f1d457839954b90e5196b71fcd36bb587d68"
    sha256 cellar: :any_skip_relocation, ventura:       "8961605d3b5533975308c2a0f8c1e029738a4dfb75e054a36918fade73b363cc"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "bc10da5020dac8ce48f383fc235fbef9573cef867ab0339b81a824ca168afd9d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "083a0025a8b6202ede5d71241048e8264ef14bdaf248212c29d718027a3568e5"
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
