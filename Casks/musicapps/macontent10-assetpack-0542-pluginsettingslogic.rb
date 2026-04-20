cask "macontent10-assetpack-0542-pluginsettingslogic" do
  version "1839b3f11be9a279fe686878fe68294c"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0542_PlugInSettingsLogic.pkg"
  name "MAContent10_AssetPack_0542_PlugInSettingsLogic"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0542_PlugInSettingsLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0542_PlugInSettingsLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0542_PlugInSettingsLogic"
end
