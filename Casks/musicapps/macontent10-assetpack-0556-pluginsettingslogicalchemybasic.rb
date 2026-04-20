cask "macontent10-assetpack-0556-pluginsettingslogicalchemybasic" do
  version "ea1e3dd0098dd7dbff71387ac8f80458"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0556_PlugInSettingsLogicAlchemyBasic.pkg"
  name "MAContent10_AssetPack_0556_PlugInSettingsLogicAlchemyBasic"
  desc "ContainsAlchemyFiles, IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0556_PlugInSettingsLogicAlchemyBasic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0556_PlugInSettingsLogicAlchemyBasic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0556_PlugInSettingsLogicAlchemyBasic"
end
