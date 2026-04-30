cask "2z695-0043-piano-lesson-3-left-hand" do
  version "fb39085c15bb9fbead8e817d601fb8e1-23"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0043_Piano%20Lesson%203_Left%20Hand.pkg"
  name "2Z695-0043_Piano Lesson 3_Left Hand"
  desc "Left Hand"
  homepage "https://audiocontentdownload.apple.com/ltp/en/basicpiano.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0043_Piano%20Lesson%203_Left%20Hand.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0043_Piano Lesson 3_Left Hand.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0043_Piano Lesson 3_Left Hand"
end
