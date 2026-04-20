cask "macontent10-assetpack-0571-drummerheavygblogic" do
  version "978c4c94930b6aa83d6710b3c27e8d47-36"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0571_DrummerHeavyGBLogic.pkg"
  name "MAContent10_AssetPack_0571_DrummerHeavyGBLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0571_DrummerHeavyGBLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0571_DrummerHeavyGBLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0571_DrummerHeavyGBLogic"
end
