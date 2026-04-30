cask "macontent10-assetpack-0575-drummermanchestergblogic" do
  version "b2ad03372f1cdf2c81140ee040efd14e-36"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0575_DrummerManchesterGBLogic.pkg"
  name "MAContent10_AssetPack_0575_DrummerManchesterGBLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0575_DrummerManchesterGBLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0575_DrummerManchesterGBLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0575_DrummerManchesterGBLogic"
end
