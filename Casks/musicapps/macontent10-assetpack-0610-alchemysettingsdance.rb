cask "macontent10-assetpack-0610-alchemysettingsdance" do
  version "79d135fb44a53b660c4e4c0878fd3159"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0610_AlchemySettingsDance.pkg"
  name "MAContent10_AssetPack_0610_AlchemySettingsDance"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0610_AlchemySettingsDance.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0610_AlchemySettingsDance.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0610_AlchemySettingsDance"
end
