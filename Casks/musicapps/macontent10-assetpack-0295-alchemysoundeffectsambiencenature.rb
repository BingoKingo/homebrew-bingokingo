cask "macontent10-assetpack-0295-alchemysoundeffectsambiencenature" do
  version "9764c89875100a4675f8c54d250b18ac-38"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0295_AlchemySoundEffectsAmbienceNature.pkg"
  name "MAContent10_AssetPack_0295_AlchemySoundEffectsAmbienceNature"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0295_AlchemySoundEffectsAmbienceNature.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0295_AlchemySoundEffectsAmbienceNature.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0295_AlchemySoundEffectsAmbienceNature"
end
