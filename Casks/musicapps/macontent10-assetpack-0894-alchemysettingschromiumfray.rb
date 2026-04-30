cask "macontent10-assetpack-0894-alchemysettingschromiumfray" do
  version "a705a327c69e036202ea66afcd2d7b43"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0894_AlchemySettingsChromiumFray.pkg"
  name "MAContent10_AssetPack_0894_AlchemySettingsChromiumFray"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0894_AlchemySettingsChromiumFray.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0894_AlchemySettingsChromiumFray.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0894_AlchemySettingsChromiumFray"
end
