cask "macontent10-assetpack-0102-alchemybassanalogrestrainedbass" do
  version "523073fb6d20bfdaa119e733cbb5ba74-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0102_AlchemyBassAnalogRestrainedBass.pkg"
  name "MAContent10_AssetPack_0102_AlchemyBassAnalogRestrainedBass"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0102_AlchemyBassAnalogRestrainedBass.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0102_AlchemyBassAnalogRestrainedBass.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0102_AlchemyBassAnalogRestrainedBass"
end
