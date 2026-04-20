cask "macontent10-assetpack-0013-alchemyloopsbeatboxdrumnbass" do
  version "d3bc3a2b80453cef44262899a8ef2bcf-7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0013_AlchemyLoopsBeatBoxDrumnBass.pkg"
  name "MAContent10_AssetPack_0013_AlchemyLoopsBeatBoxDrumnBass"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0013_AlchemyLoopsBeatBoxDrumnBass.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0013_AlchemyLoopsBeatBoxDrumnBass.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0013_AlchemyLoopsBeatBoxDrumnBass"
end
