cask "macontent10-assetpack-0342-irswarpedtextures" do
  version "cc2d3bfa6d1846b887896e4cac2e6784-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0342_IRsWarpedTextures.pkg"
  name "MAContent10_AssetPack_0342_IRsWarpedTextures"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0342_IRsWarpedTextures.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0342_IRsWarpedTextures.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0342_IRsWarpedTextures"
end
