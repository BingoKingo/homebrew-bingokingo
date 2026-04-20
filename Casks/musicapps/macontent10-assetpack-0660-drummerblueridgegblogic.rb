cask "macontent10-assetpack-0660-drummerblueridgegblogic" do
  version "83d4c4a7b7ce2e6dcab2c5b92623a544-24"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0660_DrummerBlueRidgeGBLogic.pkg"
  name "MAContent10_AssetPack_0660_DrummerBlueRidgeGBLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0660_DrummerBlueRidgeGBLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0660_DrummerBlueRidgeGBLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0660_DrummerBlueRidgeGBLogic"
end
