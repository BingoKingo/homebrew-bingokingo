cask "macontent10-assetpack-0627-alchemysettingsbasicessential" do
  version "af6eb591d84827c64976a32b79a71f6b"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0627_AlchemySettingsBasicEssential.pkg"
  name "MAContent10_AssetPack_0627_AlchemySettingsBasicEssential"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0627_AlchemySettingsBasicEssential.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0627_AlchemySettingsBasicEssential.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0627_AlchemySettingsBasicEssential"
end
