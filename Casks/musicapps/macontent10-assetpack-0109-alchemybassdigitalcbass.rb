cask "macontent10-assetpack-0109-alchemybassdigitalcbass" do
  version "81d9810c1ccb72fc0adb0a119b1d73a1-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0109_AlchemyBassDigitalCBass.pkg"
  name "MAContent10_AssetPack_0109_AlchemyBassDigitalCBass"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0109_AlchemyBassDigitalCBass.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0109_AlchemyBassDigitalCBass.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0109_AlchemyBassDigitalCBass"
end
