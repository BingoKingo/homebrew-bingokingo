cask "macontent10-assetpack-0649-pluginsettingslogic" do
  version "6d5e488ce56b6c0f383c503255fd6157"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0649_PlugInSettingsLogic.pkg"
  name "MAContent10_AssetPack_0649_PlugInSettingsLogic"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0649_PlugInSettingsLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0649_PlugInSettingsLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0649_PlugInSettingsLogic"
end
