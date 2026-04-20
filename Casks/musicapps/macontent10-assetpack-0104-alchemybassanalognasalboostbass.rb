cask "macontent10-assetpack-0104-alchemybassanalognasalboostbass" do
  version "3b9f9cf8f1727d6b4a36b0308cf09824-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0104_AlchemyBassAnalogNasalBoostBass.pkg"
  name "MAContent10_AssetPack_0104_AlchemyBassAnalogNasalBoostBass"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0104_AlchemyBassAnalogNasalBoostBass.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0104_AlchemyBassAnalogNasalBoostBass.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0104_AlchemyBassAnalogNasalBoostBass"
end
