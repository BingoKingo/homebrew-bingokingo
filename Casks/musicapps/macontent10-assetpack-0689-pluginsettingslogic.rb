cask "macontent10-assetpack-0689-pluginsettingslogic" do
  version "fd5a01c11e8844a459738175b9b306b0"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0689_PlugInSettingsLogic.pkg"
  name "MAContent10_AssetPack_0689_PlugInSettingsLogic"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0689_PlugInSettingsLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0689_PlugInSettingsLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0689_PlugInSettingsLogic"
end
