cask "macontent10-assetpack-0910-pluginsettingsgblogic" do
  version "b35e709f984de2155849efc72499c221"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0910_PlugInSettingsGBLogic.pkg"
  name "MAContent10_AssetPack_0910_PlugInSettingsGBLogic"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0910_PlugInSettingsGBLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0910_PlugInSettingsGBLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0910_PlugInSettingsGBLogic"
end
