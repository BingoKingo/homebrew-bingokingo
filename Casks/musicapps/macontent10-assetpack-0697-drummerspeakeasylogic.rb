cask "macontent10-assetpack-0697-drummerspeakeasylogic" do
  version "bd38bdac87fd7cf2d8968420840cf804-22"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0697_DrummerSpeakeasyLogic.pkg"
  name "MAContent10_AssetPack_0697_DrummerSpeakeasyLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0697_DrummerSpeakeasyLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0697_DrummerSpeakeasyLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0697_DrummerSpeakeasyLogic"
end
