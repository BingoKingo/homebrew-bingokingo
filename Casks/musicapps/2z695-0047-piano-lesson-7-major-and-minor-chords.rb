cask "2z695-0047-piano-lesson-7-major-and-minor-chords" do
  version "1f181b02496e08884034b2482079eed5-26"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0047_Piano%20Lesson%207_Major%20and%20Minor%20Chords.pkg"
  name "2Z695-0047_Piano Lesson 7_Major and Minor Chords"
  desc "Major and Minor Chords"
  homepage "https://audiocontentdownload.apple.com/ltp/en/basicpiano.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0047_Piano%20Lesson%207_Major%20and%20Minor%20Chords.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0047_Piano Lesson 7_Major and Minor Chords.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0047_Piano Lesson 7_Major and Minor Chords"
end
