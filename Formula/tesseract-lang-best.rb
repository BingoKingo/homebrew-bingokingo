class TesseractLangBest < Formula
  desc "Enables extra languages support for Tesseract"
  homepage "https://github.com/tesseract-ocr/tessdata_best/"
  url "https://github.com/tesseract-ocr/tessdata_best/archive/refs/tags/4.1.0.tar.gz"
  sha256 "bb05b738298ae73e7130e2913ed002b49d94cd1cea508e63be1928fe47770b32"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "dd2de5d3786642a468ae042a810368fe2be1afe895d44a30ac48b44612775f4e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "594a3bf247d794242144c06bc7ce1c9eb433c9afc8576b0230cdb511e7096b11"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "676399f37ab9776e37924c98f2e73930d404d1bec784cd9ee47eab3b83b4c7cc"
    sha256 cellar: :any_skip_relocation, ventura:       "b8eb5f0e144741d91b1527b9c8090318460a8f302c753575c197806862103aee"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "909011403b5cc8ff0c63106384589dac65fab5a831767e5ecf59a02f41507832"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "73cf09868b3bba8058d8372ed5761a85d7d2b5f74cc0e86174858df80fe25026"
  end

  depends_on "tesseract"
  conflicts_with "tesseract-lang"
  conflicts_with "tesseract-lang-old"
  resource "testfile" do
    url "https://raw.githubusercontent.com/tesseract-ocr/test/6dd816cdaf3e76153271daf773e562e24c928bf5/testing/eurotext.tif"
    sha256 "7b9bd14aba7d5e30df686fbb6f71782a97f48f81b32dc201a1b75afe6de747d6"
  end

  def install
    rm "eng.traineddata"
    rm "osd.traineddata"
    (share/"tessdata").install Dir["*"]
  end

  test do
    resource("testfile").stage do
      system "#{Formula["tesseract"].bin}/tesseract", "./eurotext.tif", "./output", "-l", "eng+deu"
      assert_match "über den faulen Hund. Le renard brun\n", File.read("output.txt")
    end
  end
end
