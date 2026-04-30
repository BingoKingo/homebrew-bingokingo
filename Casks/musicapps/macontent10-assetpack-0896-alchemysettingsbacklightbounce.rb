cask "macontent10-assetpack-0896-alchemysettingsbacklightbounce" do
  version "bdda1241872395b5447c5c9e1dc4bd0e"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0896_AlchemySettingsBacklightBounce.pkg"
  name "MAContent10_AssetPack_0896_AlchemySettingsBacklightBounce"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0896_AlchemySettingsBacklightBounce.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0896_AlchemySettingsBacklightBounce.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0896_AlchemySettingsBacklightBounce"
end
