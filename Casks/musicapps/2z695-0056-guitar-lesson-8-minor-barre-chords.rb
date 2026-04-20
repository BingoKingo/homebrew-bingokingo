cask "2z695-0056-guitar-lesson-8-minor-barre-chords" do
  version "194bdf62e5e630a4e5db1315d40b6558-40"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0056_Guitar%20Lesson%208_Minor%20Barre%20Chords.pkg"
  name "2Z695-0056_Guitar Lesson 8_Minor Barre Chords"
  desc "Movable minor barre chords on the 6th and 5th strings, simple arpeggio pattern"
  homepage "https://audiocontentdownload.apple.com/ltp/en/basicguitar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0056_Guitar%20Lesson%208_Minor%20Barre%20Chords.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0056_Guitar Lesson 8_Minor Barre Chords.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0056_Guitar Lesson 8_Minor Barre Chords"
end
