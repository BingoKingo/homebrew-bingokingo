cask "macontent10-assetpack-0619-alchemysettingsatmospheric" do
  version "3b8b14b76fb356c4e094ddbb4dfc9242"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0619_AlchemySettingsAtmospheric.pkg"
  name "MAContent10_AssetPack_0619_AlchemySettingsAtmospheric"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0619_AlchemySettingsAtmospheric.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0619_AlchemySettingsAtmospheric.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0619_AlchemySettingsAtmospheric"
end
