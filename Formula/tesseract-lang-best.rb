class TesseractLangBest < Formula
  desc "Enables extra languages support for Tesseract"
  homepage "https://github.com/tesseract-ocr/tessdata_best/"
  url "https://github.com/tesseract-ocr/tessdata_best/archive/refs/tags/4.1.0.tar.gz"
  sha256 "bb05b738298ae73e7130e2913ed002b49d94cd1cea508e63be1928fe47770b32"
  license "Apache-2.0"

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
