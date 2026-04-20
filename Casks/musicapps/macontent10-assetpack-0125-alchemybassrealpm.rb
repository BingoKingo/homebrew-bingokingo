cask "macontent10-assetpack-0125-alchemybassrealpm" do
  version "9bd2d1d6cc5ce2d36f6b0eb46cd84dcc"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0125_AlchemyBassRealPM.pkg"
  name "MAContent10_AssetPack_0125_AlchemyBassRealPM"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0125_AlchemyBassRealPM.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0125_AlchemyBassRealPM.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0125_AlchemyBassRealPM"
end
