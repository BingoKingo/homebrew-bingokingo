cask "macontent10-assetpack-0593-drummersocalgblogic" do
  version "df922f34a69027d7ce96a7f182339914-31"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0593_DrummerSoCalGBLogic.pkg"
  name "MAContent10_AssetPack_0593_DrummerSoCalGBLogic"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0593_DrummerSoCalGBLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0593_DrummerSoCalGBLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0593_DrummerSoCalGBLogic"
end
