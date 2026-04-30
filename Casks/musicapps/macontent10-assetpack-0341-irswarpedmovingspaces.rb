cask "macontent10-assetpack-0341-irswarpedmovingspaces" do
  version "ea79d6858511f3e774770c35d1492f42-12"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0341_IRsWarpedMovingSpaces.pkg"
  name "MAContent10_AssetPack_0341_IRsWarpedMovingSpaces"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0341_IRsWarpedMovingSpaces.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0341_IRsWarpedMovingSpaces.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0341_IRsWarpedMovingSpaces"
end
