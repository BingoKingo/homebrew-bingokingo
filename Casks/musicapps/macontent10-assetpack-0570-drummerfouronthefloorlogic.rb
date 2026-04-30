cask "macontent10-assetpack-0570-drummerfouronthefloorlogic" do
  version "3b0604183297648fc734af89d60726d9-7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0570_DrummerFourOnTheFloorLogic.pkg"
  name "MAContent10_AssetPack_0570_DrummerFourOnTheFloorLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0570_DrummerFourOnTheFloorLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0570_DrummerFourOnTheFloorLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0570_DrummerFourOnTheFloorLogic"
end
