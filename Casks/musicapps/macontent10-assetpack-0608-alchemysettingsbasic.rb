cask "macontent10-assetpack-0608-alchemysettingsbasic" do
  version "42c289d019fb46b384312e4773a5a07d"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0608_AlchemySettingsBasic.pkg"
  name "MAContent10_AssetPack_0608_AlchemySettingsBasic"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0608_AlchemySettingsBasic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0608_AlchemySettingsBasic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0608_AlchemySettingsBasic"
end
