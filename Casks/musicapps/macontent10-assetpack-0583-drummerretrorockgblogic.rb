cask "macontent10-assetpack-0583-drummerretrorockgblogic" do
  version "c7b157d9d72d9dcc01b56ccdbdc0f966-39"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0583_DrummerRetroRockGBLogic.pkg"
  name "MAContent10_AssetPack_0583_DrummerRetroRockGBLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0583_DrummerRetroRockGBLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0583_DrummerRetroRockGBLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0583_DrummerRetroRockGBLogic"
end
