cask "2z695-0097-blues-guitar-7-blues-scale-and-quarter-bends" do
  version "cc6aa8c7dc506b5e839eced95ca908f6-121"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0097_Blues%20Guitar%207_Blues%20Scale%20and%20Quarter%20Bends.pkg"
  name "2Z695-0097_Blues Guitar 7_Blues Scale and Quarter Bends"
  desc "Blues Scales and Quarter-step Bends"
  homepage "https://audiocontentdownload.apple.com/ltp/en/bluesguitar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0097_Blues%20Guitar%207_Blues%20Scale%20and%20Quarter%20Bends.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0097_Blues Guitar 7_Blues Scale and Quarter Bends.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0097_Blues Guitar 7_Blues Scale and Quarter Bends"
end
