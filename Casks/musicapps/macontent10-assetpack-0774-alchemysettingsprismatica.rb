cask "macontent10-assetpack-0774-alchemysettingsprismatica" do
  version "6d2b4f5dd28f83d65f2b4dfcb32b9dd0"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0774_AlchemySettingsPrismatica.pkg"
  name "MAContent10_AssetPack_0774_AlchemySettingsPrismatica"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0774_AlchemySettingsPrismatica.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0774_AlchemySettingsPrismatica.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0774_AlchemySettingsPrismatica"
end
