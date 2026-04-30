cask "macontent10-assetpack-0895-alchemysettingstransitioneffects" do
  version "75ed3360bb5201bb4f8a3f27703931b6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0895_AlchemySettingsTransitionEffects.pkg"
  name "MAContent10_AssetPack_0895_AlchemySettingsTransitionEffects"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0895_AlchemySettingsTransitionEffects.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0895_AlchemySettingsTransitionEffects.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0895_AlchemySettingsTransitionEffects"
end
