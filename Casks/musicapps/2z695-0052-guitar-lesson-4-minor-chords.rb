cask "2z695-0052-guitar-lesson-4-minor-chords" do
  version "493987ab95191e1f277039dde62be3df-40"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0052_Guitar%20Lesson%204_Minor%20Chords.pkg"
  name "2Z695-0052_Guitar Lesson 4_Minor Chords"
  desc "Open E minor, A minor and D minor chords, using a capo, 12/8 strumming pattern"
  homepage "https://audiocontentdownload.apple.com/ltp/en/basicguitar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0052_Guitar%20Lesson%204_Minor%20Chords.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0052_Guitar Lesson 4_Minor Chords.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0052_Guitar Lesson 4_Minor Chords"
end
