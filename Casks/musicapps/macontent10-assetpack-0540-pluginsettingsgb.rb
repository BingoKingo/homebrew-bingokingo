cask "macontent10-assetpack-0540-pluginsettingsgb" do
  version "c3481966caf5a0d2fa1ff9c8389d761b"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0540_PlugInSettingsGB.pkg"
  name "MAContent10_AssetPack_0540_PlugInSettingsGB"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0540_PlugInSettingsGB.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0540_PlugInSettingsGB.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0540_PlugInSettingsGB"
end
