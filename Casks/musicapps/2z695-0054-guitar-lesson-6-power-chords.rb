cask "2z695-0054-guitar-lesson-6-power-chords" do
  version "bf86e9e888c910edbc3b477c1b938e7e-47"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0054_Guitar%20Lesson%206_Power%20Chords.pkg"
  name "2Z695-0054_Guitar Lesson 6_Power Chords"
  desc "Movable power chords on the 6th and 5th strings, palm mute strumming"
  homepage "https://audiocontentdownload.apple.com/ltp/en/basicguitar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0054_Guitar%20Lesson%206_Power%20Chords.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0054_Guitar Lesson 6_Power Chords.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0054_Guitar Lesson 6_Power Chords"
end
