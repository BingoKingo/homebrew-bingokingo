cask "2z695-0053-guitar-lesson-5-single-note-melodies" do
  version "93443d6883d60c9c0d6eb25a983d15e0-37"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0053_Guitar%20Lesson%205_Single%20Note%20Melodies.pkg"
  name "2Z695-0053_Guitar Lesson 5_Single Note Melodies"
  desc "TAB notation, down-up picking, notes on the fretboard"
  homepage "https://audiocontentdownload.apple.com/ltp/en/basicguitar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0053_Guitar%20Lesson%205_Single%20Note%20Melodies.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0053_Guitar Lesson 5_Single Note Melodies.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0053_Guitar Lesson 5_Single Note Melodies"
end
