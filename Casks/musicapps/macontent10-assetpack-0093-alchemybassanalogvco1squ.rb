cask "macontent10-assetpack-0093-alchemybassanalogvco1squ" do
  version "547cd3802382dd542fb72bd4280b290a-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0093_AlchemyBassAnalogVCO1Squ.pkg"
  name "MAContent10_AssetPack_0093_AlchemyBassAnalogVCO1Squ"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0093_AlchemyBassAnalogVCO1Squ.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0093_AlchemyBassAnalogVCO1Squ.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0093_AlchemyBassAnalogVCO1Squ"
end
