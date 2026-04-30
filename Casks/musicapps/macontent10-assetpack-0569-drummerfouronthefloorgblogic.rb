cask "macontent10-assetpack-0569-drummerfouronthefloorgblogic" do
  version "aa41acf628c755cec1cbbd13258f7512-34"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0569_DrummerFourOnTheFloorGBLogic.pkg"
  name "MAContent10_AssetPack_0569_DrummerFourOnTheFloorGBLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0569_DrummerFourOnTheFloorGBLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0569_DrummerFourOnTheFloorGBLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0569_DrummerFourOnTheFloorGBLogic"
end
