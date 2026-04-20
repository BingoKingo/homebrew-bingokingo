cask "macontent10-assetpack-0122-alchemybassrealtrad" do
  version "820875d7a13a408d49ee92a2d1cd37c8-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0122_AlchemyBassRealTrad.pkg"
  name "MAContent10_AssetPack_0122_AlchemyBassRealTrad"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0122_AlchemyBassRealTrad.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0122_AlchemyBassRealTrad.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0122_AlchemyBassRealTrad"
end
