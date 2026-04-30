cask "macontent10-assetpack-0006-alchemykeysotherncustom" do
  version "433dc4fa17dc02c66504fa9d466825db-9"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0006_AlchemyKeysOtherNCustom.pkg"
  name "MAContent10_AssetPack_0006_AlchemyKeysOtherNCustom"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0006_AlchemyKeysOtherNCustom.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0006_AlchemyKeysOtherNCustom.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0006_AlchemyKeysOtherNCustom"
end
