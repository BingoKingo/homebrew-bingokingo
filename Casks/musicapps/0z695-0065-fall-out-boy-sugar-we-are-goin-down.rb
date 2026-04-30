cask "0z695-0065-fall-out-boy-sugar-we-are-goin-down" do
  version "c7366e207c44e6cf04b99ab6f3e90819-53"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0065_Fall%20Out%20Boy_Sugar%20We%20are%20Goin%20Down.pkg"
  name "0Z695-0065_Fall Out Boy_Sugar We are Goin Down"
  desc "Lead singer and guitarist Patrick Stump of Fall Out Boy teaches you how to play"
  homepage "https://audiocontentdownload.apple.com/ltp/en/sugar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0065_Fall%20Out%20Boy_Sugar%20We%20are%20Goin%20Down.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0065_Fall Out Boy_Sugar We are Goin Down.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0065_Fall Out Boy_Sugar We are Goin Down"
end
