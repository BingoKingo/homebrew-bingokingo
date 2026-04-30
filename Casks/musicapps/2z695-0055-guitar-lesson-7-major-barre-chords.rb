cask "2z695-0055-guitar-lesson-7-major-barre-chords" do
  version "06e47270dd3668d0cad9863811fe07c9-43"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0055_Guitar%20Lesson%207_Major%20Barre%20Chords.pkg"
  name "2Z695-0055_Guitar Lesson 7_Major Barre Chords"
  desc "Movable major barre chords on the 6th and 5th strings, partial strums, barre cho"
  homepage "https://audiocontentdownload.apple.com/ltp/en/basicguitar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0055_Guitar%20Lesson%207_Major%20Barre%20Chords.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0055_Guitar Lesson 7_Major Barre Chords.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0055_Guitar Lesson 7_Major Barre Chords"
end
