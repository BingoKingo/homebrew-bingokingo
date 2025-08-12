class Ctrtool < Formula
  desc "General purpose reading/extraction tool for Nintendo 3DS file formats"
  homepage "https://github.com/3DSGuy/Project_CTR/"
  url "https://github.com/3DSGuy/Project_CTR/archive/refs/tags/ctrtool-v1.2.1.tar.gz"
  sha256 "8ad69c2abd3b51ea9a27999052f2b932a6dfd29dce66904eac2ea0391c0bbe2f"
  license "MIT"
  head "https://github.com/3DSGuy/Project_CTR.git", branch: "master"

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
      \033[1m[M]\033[0m Modified from
      https://github.com/mistydemeo/homebrew-formulae/blob/master/Formula/ctrtool.rb
    EOS
  end
  test do
    assert_match("CTRTool v#{version} (C) jakcron", shell_output("#{bin}/ctrtool 2>&1", 1))
    system bin/"makerom", "-help"
  end
end
