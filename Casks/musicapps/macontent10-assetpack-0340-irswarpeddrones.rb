cask "macontent10-assetpack-0340-irswarpeddrones" do
  version "777a41ba63180607e8e1c6e52acf7a98-12"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0340_IRsWarpedDrones.pkg"
  name "MAContent10_AssetPack_0340_IRsWarpedDrones"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0340_IRsWarpedDrones.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0340_IRsWarpedDrones.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0340_IRsWarpedDrones"
end
