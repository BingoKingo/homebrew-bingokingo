cask "2z695-0046-piano-lesson-6-rhythmic-accents" do
  version "994aa75a58f21a2fd572d04556a75360-32"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0046_Piano%20Lesson%206_Rhythmic%20Accents.pkg"
  name "2Z695-0046_Piano Lesson 6_Rhythmic Accents"
  desc "Rhythmic Accents"
  homepage "https://audiocontentdownload.apple.com/ltp/en/basicpiano.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0046_Piano%20Lesson%206_Rhythmic%20Accents.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0046_Piano Lesson 6_Rhythmic Accents.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0046_Piano Lesson 6_Rhythmic Accents"
end
