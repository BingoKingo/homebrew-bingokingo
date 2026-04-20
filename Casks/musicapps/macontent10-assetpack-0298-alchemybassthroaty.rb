cask "macontent10-assetpack-0298-alchemybassthroaty" do
  version "82415932744727aa138ae2d4e86d374c-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0298_AlchemyBassThroaty.pkg"
  name "MAContent10_AssetPack_0298_AlchemyBassThroaty"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0298_AlchemyBassThroaty.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0298_AlchemyBassThroaty.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0298_AlchemyBassThroaty"
end
