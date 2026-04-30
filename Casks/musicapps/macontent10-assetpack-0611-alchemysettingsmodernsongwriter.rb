cask "macontent10-assetpack-0611-alchemysettingsmodernsongwriter" do
  version "909c99ef7cad255bc8c86155777e41a3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0611_AlchemySettingsModernSongwriter.pkg"
  name "MAContent10_AssetPack_0611_AlchemySettingsModernSongwriter"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0611_AlchemySettingsModernSongwriter.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0611_AlchemySettingsModernSongwriter.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0611_AlchemySettingsModernSongwriter"
end
