cask "macontent10-assetpack-0117-alchemybassrealmm" do
  version "4ce874dd7507a890b159c36e528a9046-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0117_AlchemyBassRealMM.pkg"
  name "MAContent10_AssetPack_0117_AlchemyBassRealMM"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0117_AlchemyBassRealMM.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0117_AlchemyBassRealMM.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0117_AlchemyBassRealMM"
end
