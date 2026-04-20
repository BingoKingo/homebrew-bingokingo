cask "macontent10-assetpack-0595-drummersunsetgblogic" do
  version "68c907e0a655bd3b157dae161664672c-35"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0595_DrummerSunsetGBLogic.pkg"
  name "MAContent10_AssetPack_0595_DrummerSunsetGBLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0595_DrummerSunsetGBLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0595_DrummerSunsetGBLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0595_DrummerSunsetGBLogic"
end
