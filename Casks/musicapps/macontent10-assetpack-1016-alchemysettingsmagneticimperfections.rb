cask "macontent10-assetpack-1016-alchemysettingsmagneticimperfections" do
  version "f260a017e4a9c4e2ec3444b860bd94da"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1016_AlchemySettingsMagneticImperfections.pkg"
  name "MAContent10_AssetPack_1016_AlchemySettingsMagneticImperfections"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1016_AlchemySettingsMagneticImperfections.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1016_AlchemySettingsMagneticImperfections.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1016_AlchemySettingsMagneticImperfections"
end
