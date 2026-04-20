cask "macontent10-assetpack-0343-irswarpeddrumtransformers" do
  version "e57c6631a0233f04e73496e2e9070cf6-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0343_IRsWarpedDrumTransformers.pkg"
  name "MAContent10_AssetPack_0343_IRsWarpedDrumTransformers"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0343_IRsWarpedDrumTransformers.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0343_IRsWarpedDrumTransformers.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0343_IRsWarpedDrumTransformers"
end
