cask "macontent10-assetpack-0690-pluginsettingsgblogic" do
  version "70bc71d3fbd0542362ef134240ccf5c5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0690_PlugInSettingsGBLogic.pkg"
  name "MAContent10_AssetPack_0690_PlugInSettingsGBLogic"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0690_PlugInSettingsGBLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0690_PlugInSettingsGBLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0690_PlugInSettingsGBLogic"
end
