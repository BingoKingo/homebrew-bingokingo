cask "macontent10-assetpack-0520-drummerfouronthefloor" do
  version "048e9c392d86801b5485ecd6594c0a5a-41"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0520_DrummerFourOnTheFloor.pkg"
  name "MAContent10_AssetPack_0520_DrummerFourOnTheFloor"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0520_DrummerFourOnTheFloor.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0520_DrummerFourOnTheFloor.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0520_DrummerFourOnTheFloor"
end
