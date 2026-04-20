cask "macontent10-assetpack-0622-alchemysettingsdance" do
  version "eb4093bdba48e9e01f2d839ac67f217d"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0622_AlchemySettingsDance.pkg"
  name "MAContent10_AssetPack_0622_AlchemySettingsDance"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0622_AlchemySettingsDance.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0622_AlchemySettingsDance.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0622_AlchemySettingsDance"
end
