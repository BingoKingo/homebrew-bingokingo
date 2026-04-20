cask "macontent10-assetpack-0113-alchemybassdigitalvbass" do
  version "0f5b874fbc7631719c8110e41526d333-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0113_AlchemyBassDigitalVBass.pkg"
  name "MAContent10_AssetPack_0113_AlchemyBassDigitalVBass"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0113_AlchemyBassDigitalVBass.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0113_AlchemyBassDigitalVBass.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0113_AlchemyBassDigitalVBass"
end
