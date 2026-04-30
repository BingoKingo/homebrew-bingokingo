cask "macontent10-assetpack-0705-alchemysettingsflexandflow" do
  version "958cf4a76874166939f055ee4f18c9d0"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0705_AlchemySettingsFlexAndFlow.pkg"
  name "MAContent10_AssetPack_0705_AlchemySettingsFlexAndFlow"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0705_AlchemySettingsFlexAndFlow.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0705_AlchemySettingsFlexAndFlow.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0705_AlchemySettingsFlexAndFlow"
end
