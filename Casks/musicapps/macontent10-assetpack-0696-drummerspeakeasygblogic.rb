cask "macontent10-assetpack-0696-drummerspeakeasygblogic" do
  version "2d0721701e4e7ce086d0e150d3dec23c-38"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0696_DrummerSpeakeasyGBLogic.pkg"
  name "MAContent10_AssetPack_0696_DrummerSpeakeasyGBLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0696_DrummerSpeakeasyGBLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0696_DrummerSpeakeasyGBLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0696_DrummerSpeakeasyGBLogic"
end
