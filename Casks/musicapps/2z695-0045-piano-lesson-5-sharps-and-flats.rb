cask "2z695-0045-piano-lesson-5-sharps-and-flats" do
  version "694f63be0119733067e3600d64969911-40"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0045_Piano%20Lesson%205_Sharps%20and%20Flats.pkg"
  name "2Z695-0045_Piano Lesson 5_Sharps and Flats"
  desc "Sharps and Flats"
  homepage "https://audiocontentdownload.apple.com/ltp/en/basicpiano.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0045_Piano%20Lesson%205_Sharps%20and%20Flats.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0045_Piano Lesson 5_Sharps and Flats.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0045_Piano Lesson 5_Sharps and Flats"
end
