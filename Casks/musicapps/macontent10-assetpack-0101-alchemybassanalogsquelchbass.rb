cask "macontent10-assetpack-0101-alchemybassanalogsquelchbass" do
  version "cdbc3557868226dcacdf54c47ae8f23f-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0101_AlchemyBassAnalogSquelchBass.pkg"
  name "MAContent10_AssetPack_0101_AlchemyBassAnalogSquelchBass"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0101_AlchemyBassAnalogSquelchBass.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0101_AlchemyBassAnalogSquelchBass.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0101_AlchemyBassAnalogSquelchBass"
end
