cask "macontent10-assetpack-0613-alchemysettingstexturesneffects" do
  version "3482f3a0fd515369360a7df455bc926e"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0613_AlchemySettingsTexturesNEffects.pkg"
  name "MAContent10_AssetPack_0613_AlchemySettingsTexturesNEffects"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0613_AlchemySettingsTexturesNEffects.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0613_AlchemySettingsTexturesNEffects.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0613_AlchemySettingsTexturesNEffects"
end
