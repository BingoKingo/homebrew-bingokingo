cask "macontent10-assetpack-0930-alchemysettingsbasicessential" do
  version "23088cbedcd15f745d80db16a459ec62"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0930_AlchemySettingsBasicEssential.pkg"
  name "MAContent10_AssetPack_0930_AlchemySettingsBasicEssential"
  desc "ContainsAlchemyFiles, IsEssentialAddition"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0930_AlchemySettingsBasicEssential.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0930_AlchemySettingsBasicEssential.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0930_AlchemySettingsBasicEssential"
end
