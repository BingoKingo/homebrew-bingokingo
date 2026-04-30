cask "2z695-0096-blues-guitar-6-hammers-pulls-and-slides" do
  version "6e08fdc7c5898a8e27f07e5085158152-78"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0096_Blues%20Guitar%206_Hammers%2C%20Pulls%2C%20and%20Slides.pkg"
  name "2Z695-0096_Blues Guitar 6_Hammers, Pulls, and Slides"
  desc "Hammers, Pulls and Slides"
  homepage "https://audiocontentdownload.apple.com/ltp/en/bluesguitar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0096_Blues%20Guitar%206_Hammers%2C%20Pulls%2C%20and%20Slides.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0096_Blues Guitar 6_Hammers, Pulls, and Slides.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0096_Blues Guitar 6_Hammers, Pulls, and Slides"
end
