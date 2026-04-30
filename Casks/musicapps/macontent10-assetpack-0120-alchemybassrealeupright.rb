cask "macontent10-assetpack-0120-alchemybassrealeupright" do
  version "aa586d94bd143fd94aecd19a9772ae29-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0120_AlchemyBassRealEUpright.pkg"
  name "MAContent10_AssetPack_0120_AlchemyBassRealEUpright"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0120_AlchemyBassRealEUpright.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0120_AlchemyBassRealEUpright.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0120_AlchemyBassRealEUpright"
end
