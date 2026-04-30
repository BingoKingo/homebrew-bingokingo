cask "macontent10-assetpack-0100-alchemybassanaloganalogfizzbass" do
  version "f5d496e66ae46c8ef238d2db33af3f17-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0100_AlchemyBassAnalogAnalogFizzBass.pkg"
  name "MAContent10_AssetPack_0100_AlchemyBassAnalogAnalogFizzBass"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0100_AlchemyBassAnalogAnalogFizzBass.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0100_AlchemyBassAnalogAnalogFizzBass.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0100_AlchemyBassAnalogAnalogFizzBass"
end
