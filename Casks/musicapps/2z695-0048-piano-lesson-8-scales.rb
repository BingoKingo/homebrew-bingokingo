cask "2z695-0048-piano-lesson-8-scales" do
  version "d694dafa388c74c5be3a253bb3ce4786-66"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0048_Piano%20Lesson%208_Scales.pkg"
  name "2Z695-0048_Piano Lesson 8_Scales"
  desc "Scales"
  homepage "https://audiocontentdownload.apple.com/ltp/en/basicpiano.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0048_Piano%20Lesson%208_Scales.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0048_Piano Lesson 8_Scales.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0048_Piano Lesson 8_Scales"
end
