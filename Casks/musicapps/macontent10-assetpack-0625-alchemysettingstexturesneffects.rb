cask "macontent10-assetpack-0625-alchemysettingstexturesneffects" do
  version "b7090f85d11a910ba326cb0787f4fb1c"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0625_AlchemySettingsTexturesNEffects.pkg"
  name "MAContent10_AssetPack_0625_AlchemySettingsTexturesNEffects"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0625_AlchemySettingsTexturesNEffects.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0625_AlchemySettingsTexturesNEffects.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0625_AlchemySettingsTexturesNEffects"
end
