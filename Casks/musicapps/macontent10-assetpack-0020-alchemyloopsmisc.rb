cask "macontent10-assetpack-0020-alchemyloopsmisc" do
  version "3e463b8b6b412e51289dc5ec63f6d4cb-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0020_AlchemyLoopsMisc.pkg"
  name "MAContent10_AssetPack_0020_AlchemyLoopsMisc"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0020_AlchemyLoopsMisc.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0020_AlchemyLoopsMisc.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0020_AlchemyLoopsMisc"
end
