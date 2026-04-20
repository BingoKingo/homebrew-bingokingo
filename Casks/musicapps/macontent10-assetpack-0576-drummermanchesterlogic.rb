cask "macontent10-assetpack-0576-drummermanchesterlogic" do
  version "d2db215a386acd899bf37a7e57d0aa6b-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0576_DrummerManchesterLogic.pkg"
  name "MAContent10_AssetPack_0576_DrummerManchesterLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0576_DrummerManchesterLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0576_DrummerManchesterLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0576_DrummerManchesterLogic"
end
