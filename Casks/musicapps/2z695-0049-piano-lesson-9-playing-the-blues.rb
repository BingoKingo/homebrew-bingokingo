cask "2z695-0049-piano-lesson-9-playing-the-blues" do
  version "88519165a954dc452cbbfc7bd3110978-59"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0049_Piano%20Lesson%209_Playing%20the%20Blues.pkg"
  name "2Z695-0049_Piano Lesson 9_Playing the Blues"
  desc "Playing the Blues"
  homepage "https://audiocontentdownload.apple.com/ltp/en/basicpiano.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0049_Piano%20Lesson%209_Playing%20the%20Blues.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0049_Piano Lesson 9_Playing the Blues.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0049_Piano Lesson 9_Playing the Blues"
end
