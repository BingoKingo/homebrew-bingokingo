class Hactool < Formula
  desc "Tool for the Nintendo Content Archives"
  homepage "https://github.com/SciresM/hactool/"
  url "https://github.com/SciresM/hactool/archive/refs/tags/1.4.0.tar.gz"
  sha256 "1373c98ef8c58da42cb1e81b361283955caad0e1b8b5ad389b0ee49b7a21da43"
  license "ISC"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "f6b5c5a414de85e4ed03a07f3632bb87e20f49f51511c877ee5f181b889682e3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "aea5eece6960292d28ab9d5edb133394b5652309569ff643a6b35b0c41a35728"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "b16c3b4d2f5e4bad9df6ab02f17a9562d53ca2bfbda8f4474e250db5c074e6f4"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "00481f3e4fa11ed66b346f74ebedf19855088d9dbfbad29da21f6fc349df537a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "55811a18237b093540e233d4a8b4c8f3f948634b3ba9d403800023cd249d253e"
  end

  def install
    cp "config.mk.template", "config.mk"
    system "make"
    bin.install "hactool"
  end

  def caveats
    <<~EOS
      [M] Modified from
      https://github.com/chasestubblefield/homebrew-brew/blob/master/hactool.rb
    EOS
  end

  test do
    output = shell_output("#{bin}/hactool 2>&1", 1)
    assert_match "hactool (c) SciresM.", output
    assert_match "Built", output
    assert_match "Usage", output
    assert_match "Options", output
  end
end
