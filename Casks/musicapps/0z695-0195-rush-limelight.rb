cask "0z695-0195-rush-limelight" do
  version "3107a57dbac4e35ce2ce9956c1453d0b-79"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0195_Rush_Limelight.pkg"
  name "0Z695-0195_Rush_Limelight"
  desc "After teaching you the classic opening riff of this song, Rush guitarist Alex Li"
  homepage "https://audiocontentdownload.apple.com/ltp/en/limelight.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/0Z695-0195_Rush_Limelight.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "0Z695-0195_Rush_Limelight.pkg"

  uninstall pkgutil: "com.apple.pkg.0Z695-0195_Rush_Limelight"
end
