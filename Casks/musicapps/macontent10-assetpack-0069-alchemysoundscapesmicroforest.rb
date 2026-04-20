cask "macontent10-assetpack-0069-alchemysoundscapesmicroforest" do
  version "7eee58fbab77d9f507e5026c7c65862b-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0069_AlchemySoundscapesMicroForest.pkg"
  name "MAContent10_AssetPack_0069_AlchemySoundscapesMicroForest"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0069_AlchemySoundscapesMicroForest.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0069_AlchemySoundscapesMicroForest.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0069_AlchemySoundscapesMicroForest"
end
