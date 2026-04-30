cask "macontent10-assetpack-0606-alchemysettingsbasicessential" do
  version "ba5606e889be8c6b8238748baaf53f8c"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0606_AlchemySettingsBasicEssential.pkg"
  name "MAContent10_AssetPack_0606_AlchemySettingsBasicEssential"
  desc "ContainsAlchemyFiles, IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0606_AlchemySettingsBasicEssential.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0606_AlchemySettingsBasicEssential.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0606_AlchemySettingsBasicEssential"
end
