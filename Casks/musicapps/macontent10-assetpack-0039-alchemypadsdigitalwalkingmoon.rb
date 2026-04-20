cask "macontent10-assetpack-0039-alchemypadsdigitalwalkingmoon" do
  version "16eeb9a186c4cb898d1162b657c694ad"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0039_AlchemyPadsDigitalWalkingMoon.pkg"
  name "MAContent10_AssetPack_0039_AlchemyPadsDigitalWalkingMoon"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0039_AlchemyPadsDigitalWalkingMoon.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0039_AlchemyPadsDigitalWalkingMoon.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0039_AlchemyPadsDigitalWalkingMoon"
end
