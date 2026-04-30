cask "macontent10-assetpack-0011-alchemyloopsbeatboxbreaks" do
  version "df82746b8f2a39aca5ffc8adb0191e5c-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0011_AlchemyLoopsBeatBoxBreaks.pkg"
  name "MAContent10_AssetPack_0011_AlchemyLoopsBeatBoxBreaks"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0011_AlchemyLoopsBeatBoxBreaks.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0011_AlchemyLoopsBeatBoxBreaks.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0011_AlchemyLoopsBeatBoxBreaks"
end
