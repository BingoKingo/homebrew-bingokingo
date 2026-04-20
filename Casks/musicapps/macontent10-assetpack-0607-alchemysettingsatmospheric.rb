cask "macontent10-assetpack-0607-alchemysettingsatmospheric" do
  version "2b05e3ab8b9536e2cb92618cd634821d"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0607_AlchemySettingsAtmospheric.pkg"
  name "MAContent10_AssetPack_0607_AlchemySettingsAtmospheric"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0607_AlchemySettingsAtmospheric.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0607_AlchemySettingsAtmospheric.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0607_AlchemySettingsAtmospheric"
end
