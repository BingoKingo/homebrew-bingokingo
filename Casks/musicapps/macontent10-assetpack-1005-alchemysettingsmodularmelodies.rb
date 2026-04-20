cask "macontent10-assetpack-1005-alchemysettingsmodularmelodies" do
  version "809cf80a30ba7289b641ab799cf19610"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1005_AlchemySettingsModularMelodies.pkg"
  name "MAContent10_AssetPack_1005_AlchemySettingsModularMelodies"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1005_AlchemySettingsModularMelodies.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1005_AlchemySettingsModularMelodies.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1005_AlchemySettingsModularMelodies"
end
