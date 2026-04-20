cask "macontent10-assetpack-0007-alchemykeyselectric" do
  version "3a62fc69fbb9aebacd07164a1925391a-7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0007_AlchemyKeysElectric.pkg"
  name "MAContent10_AssetPack_0007_AlchemyKeysElectric"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0007_AlchemyKeysElectric.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0007_AlchemyKeysElectric.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0007_AlchemyKeysElectric"
end
