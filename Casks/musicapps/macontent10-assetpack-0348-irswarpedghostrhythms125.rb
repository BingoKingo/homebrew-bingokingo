cask "macontent10-assetpack-0348-irswarpedghostrhythms125" do
  version "ac541d07fb01d94fa00d830ac16aee25-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0348_IRsWarpedGhostRhythms125.pkg"
  name "MAContent10_AssetPack_0348_IRsWarpedGhostRhythms125"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0348_IRsWarpedGhostRhythms125.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0348_IRsWarpedGhostRhythms125.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0348_IRsWarpedGhostRhythms125"
end
