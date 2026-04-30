cask "macontent10-assetpack-0661-drummerblueridgelogic" do
  version "957d205e13ee3acfcab69d7ce29d128d-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0661_DrummerBlueRidgeLogic.pkg"
  name "MAContent10_AssetPack_0661_DrummerBlueRidgeLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0661_DrummerBlueRidgeLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0661_DrummerBlueRidgeLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0661_DrummerBlueRidgeLogic"
end
