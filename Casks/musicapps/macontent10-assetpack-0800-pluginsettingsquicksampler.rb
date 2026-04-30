cask "macontent10-assetpack-0800-pluginsettingsquicksampler" do
  version "45cae13be35732435d910ccd190a3018"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0800_PlugInSettingsQuickSampler.pkg"
  name "MAContent10_AssetPack_0800_PlugInSettingsQuickSampler"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0800_PlugInSettingsQuickSampler.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0800_PlugInSettingsQuickSampler.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0800_PlugInSettingsQuickSampler"
end
