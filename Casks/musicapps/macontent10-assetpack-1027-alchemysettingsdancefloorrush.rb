cask "macontent10-assetpack-1027-alchemysettingsdancefloorrush" do
  version "3f775ba8a9ca13f29a53178616cd19bd"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1027_AlchemySettingsDancefloorRush.pkg"
  name "MAContent10_AssetPack_1027_AlchemySettingsDancefloorRush"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1027_AlchemySettingsDancefloorRush.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1027_AlchemySettingsDancefloorRush.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1027_AlchemySettingsDancefloorRush"
end
