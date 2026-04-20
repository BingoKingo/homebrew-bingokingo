cask "macontent10-assetpack-0596-drummersunsetlogic" do
  version "933b372d5662525bab874c1791459824-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0596_DrummerSunsetLogic.pkg"
  name "MAContent10_AssetPack_0596_DrummerSunsetLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0596_DrummerSunsetLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0596_DrummerSunsetLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0596_DrummerSunsetLogic"
end
