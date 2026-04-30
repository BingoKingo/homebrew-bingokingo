cask "2z695-0057-guitar-lesson-9-blues-lead" do
  version "65339b637ab4473297f2a2616549ec9f-52"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0057_Guitar%20Lesson%209_Blues%20Lead.pkg"
  name "2Z695-0057_Guitar Lesson 9_Blues Lead"
  desc "Minor pentatonic scale, lead licks, introduction to solo techniques"
  homepage "https://audiocontentdownload.apple.com/ltp/en/basicguitar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0057_Guitar%20Lesson%209_Blues%20Lead.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0057_Guitar Lesson 9_Blues Lead.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0057_Guitar Lesson 9_Blues Lead"
end
