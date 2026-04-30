cask "macontent10-assetpack-0965-alchemysettingshardwell" do
  version "1ce00df01c0054072b8ad13981b46031"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0965_AlchemySettingsHardwell.pkg"
  name "MAContent10_AssetPack_0965_AlchemySettingsHardwell"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0965_AlchemySettingsHardwell.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0965_AlchemySettingsHardwell.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0965_AlchemySettingsHardwell"
end
