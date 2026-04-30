cask "2z695-0044-piano-lesson-4-rhythm" do
  version "1367db3820ea776c7a2d74b745b6e113-25"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0044_Piano%20Lesson%204_Rhythm.pkg"
  name "2Z695-0044_Piano Lesson 4_Rhythm"
  desc "Rhythm"
  homepage "https://audiocontentdownload.apple.com/ltp/en/basicpiano.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0044_Piano%20Lesson%204_Rhythm.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0044_Piano Lesson 4_Rhythm.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0044_Piano Lesson 4_Rhythm"
end
