cask "macontent10-assetpack-0124-alchemybassrealeletric" do
  version "3e75814c4840f4e72a3c601b26492d01"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0124_AlchemyBassRealEletric.pkg"
  name "MAContent10_AssetPack_0124_AlchemyBassRealEletric"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0124_AlchemyBassRealEletric.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0124_AlchemyBassRealEletric.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0124_AlchemyBassRealEletric"
end
