cask "2z695-0108-pop-piano-6-melodic-embellishment" do
  version "e59fd367c46ea34a58f376e7687494e8-63"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0108_Pop%20Piano%206_Melodic%20Embellishment.pkg"
  name "2Z695-0108_Pop Piano 6_Melodic Embellishment"
  desc "Melodic Embellishments"
  homepage "https://audiocontentdownload.apple.com/ltp/en/poppiano.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0108_Pop%20Piano%206_Melodic%20Embellishment.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0108_Pop Piano 6_Melodic Embellishment.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0108_Pop Piano 6_Melodic Embellishment"
end
