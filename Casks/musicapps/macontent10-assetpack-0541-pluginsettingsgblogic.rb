cask "macontent10-assetpack-0541-pluginsettingsgblogic" do
  version "3359cde6c80908f920096e65a51a1b26"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0541_PlugInSettingsGBLogic.pkg"
  name "MAContent10_AssetPack_0541_PlugInSettingsGBLogic"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0541_PlugInSettingsGBLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0541_PlugInSettingsGBLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0541_PlugInSettingsGBLogic"
end
