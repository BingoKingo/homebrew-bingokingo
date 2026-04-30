cask "macontent10-assetpack-0620-alchemysettingsbasic" do
  version "41884926707b290a229a5bfe838fae2c"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0620_AlchemySettingsBasic.pkg"
  name "MAContent10_AssetPack_0620_AlchemySettingsBasic"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0620_AlchemySettingsBasic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0620_AlchemySettingsBasic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0620_AlchemySettingsBasic"
end
