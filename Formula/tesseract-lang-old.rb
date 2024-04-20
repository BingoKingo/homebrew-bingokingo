class TesseractLangOld < Formula
  desc "Enables extra languages support for Tesseract"
  homepage "https://github.com/tesseract-ocr/tessdata/"
  url "https://github.com/tesseract-ocr/tessdata/archive/refs/tags/4.1.0.tar.gz"
  sha256 "990fffb9b7a9b52dc9a2d053a9ef6852ca2b72bd8dfb22988b0b990a700fd3c7"
  license "Apache-2.0"

  depends_on "tesseract"
  conflicts_with "tesseract-lang"
  conflicts_with "tesseract-lang-best"
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
