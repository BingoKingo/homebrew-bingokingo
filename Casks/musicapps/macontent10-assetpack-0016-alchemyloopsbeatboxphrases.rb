cask "macontent10-assetpack-0016-alchemyloopsbeatboxphrases" do
  version "91cc17f226ec068a2016b7867def9194-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0016_AlchemyLoopsBeatBoxPhrases.pkg"
  name "MAContent10_AssetPack_0016_AlchemyLoopsBeatBoxPhrases"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0016_AlchemyLoopsBeatBoxPhrases.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0016_AlchemyLoopsBeatBoxPhrases.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0016_AlchemyLoopsBeatBoxPhrases"
end
