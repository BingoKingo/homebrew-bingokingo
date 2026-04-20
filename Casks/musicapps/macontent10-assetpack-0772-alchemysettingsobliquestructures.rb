cask "macontent10-assetpack-0772-alchemysettingsobliquestructures" do
  version "f1caa95d5f9d216acabf56435106e1f5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0772_AlchemySettingsObliqueStructures.pkg"
  name "MAContent10_AssetPack_0772_AlchemySettingsObliqueStructures"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0772_AlchemySettingsObliqueStructures.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0772_AlchemySettingsObliqueStructures.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0772_AlchemySettingsObliqueStructures"
end
