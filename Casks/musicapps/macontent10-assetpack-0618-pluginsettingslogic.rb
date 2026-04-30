cask "macontent10-assetpack-0618-pluginsettingslogic" do
  version "b3b98f64a06ff668f6b90a277abd55f4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0618_PlugInSettingsLogic.pkg"
  name "MAContent10_AssetPack_0618_PlugInSettingsLogic"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0618_PlugInSettingsLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0618_PlugInSettingsLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0618_PlugInSettingsLogic"
end
