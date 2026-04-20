cask "2z695-0051-guitar-lesson-3-chords-a-and-d" do
  version "7cee5f3fb1d2dc9a97589340e0b16ee8-25"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0051_Guitar%20Lesson%203_Chords%20-%20A%20and%20D.pkg"
  name "2Z695-0051_Guitar Lesson 3_Chords - A and D"
  desc "Open A and D chords, shuffle strumming pattern, open chord blues progression in"
  homepage "https://audiocontentdownload.apple.com/ltp/en/basicguitar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0051_Guitar%20Lesson%203_Chords%20-%20A%20and%20D.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0051_Guitar Lesson 3_Chords - A and D.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0051_Guitar Lesson 3_Chords - A and D"
end
