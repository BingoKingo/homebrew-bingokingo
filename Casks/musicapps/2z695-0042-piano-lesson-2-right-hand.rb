cask "2z695-0042-piano-lesson-2-right-hand" do
  version "d83d06418ac189338fcb26f7dfb642e8-20"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0042_Piano%20Lesson%202_Right%20Hand.pkg"
  name "2Z695-0042_Piano Lesson 2_Right Hand"
  desc "Single notes and chords in the treble clef, Beethovens Ode to Joy"
  homepage "https://audiocontentdownload.apple.com/ltp/en/basicpiano.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0042_Piano%20Lesson%202_Right%20Hand.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0042_Piano Lesson 2_Right Hand.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0042_Piano Lesson 2_Right Hand"
end
