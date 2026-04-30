cask "macontent10-assetpack-0015-alchemyloopsbeatboxhiphop" do
  version "6958cb3fc44d4857e6de332d0f7a8b49-10"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0015_AlchemyLoopsBeatBoxHipHop.pkg"
  name "MAContent10_AssetPack_0015_AlchemyLoopsBeatBoxHipHop"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0015_AlchemyLoopsBeatBoxHipHop.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0015_AlchemyLoopsBeatBoxHipHop.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0015_AlchemyLoopsBeatBoxHipHop"
end
