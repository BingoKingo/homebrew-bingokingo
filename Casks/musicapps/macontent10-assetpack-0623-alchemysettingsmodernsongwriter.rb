cask "macontent10-assetpack-0623-alchemysettingsmodernsongwriter" do
  version "280612c7c468cd4bf4958d1f78fcfed0"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0623_AlchemySettingsModernSongwriter.pkg"
  name "MAContent10_AssetPack_0623_AlchemySettingsModernSongwriter"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0623_AlchemySettingsModernSongwriter.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0623_AlchemySettingsModernSongwriter.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0623_AlchemySettingsModernSongwriter"
end
