cask "macontent10-assetpack-0291-alchemysoundeffectsfoley" do
  version "321f3cf8bd3a8d9985952e54efef683d-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0291_AlchemySoundEffectsFoley.pkg"
  name "MAContent10_AssetPack_0291_AlchemySoundEffectsFoley"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0291_AlchemySoundEffectsFoley.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0291_AlchemySoundEffectsFoley.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0291_AlchemySoundEffectsFoley"
end
