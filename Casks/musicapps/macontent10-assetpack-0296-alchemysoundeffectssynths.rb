cask "macontent10-assetpack-0296-alchemysoundeffectssynths" do
  version "66b8eb04b7261108f6cf6773d1051e19-63"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0296_AlchemySoundEffectsSynths.pkg"
  name "MAContent10_AssetPack_0296_AlchemySoundEffectsSynths"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0296_AlchemySoundEffectsSynths.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0296_AlchemySoundEffectsSynths.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0296_AlchemySoundEffectsSynths"
end
