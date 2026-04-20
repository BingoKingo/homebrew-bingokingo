cask "macontent10-assetpack-0756-appleloopsskylineheat" do
  version "e63106a2d119be9f195c4d6b2f36dff5-9"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0756_AppleLoopsSkylineHeat.pkg"
  name "MAContent10_AssetPack_0756_AppleLoopsSkylineHeat"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0756_AppleLoopsSkylineHeat.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0756_AppleLoopsSkylineHeat.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0756_AppleLoopsSkylineHeat"
end
