cask "macontent10-assetpack-0290-alchemysoundeffectstoypercussion" do
  version "87b344e8603cb83ee8008aad7dcf2d8e-7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0290_AlchemySoundEffectsToyPercussion.pkg"
  name "MAContent10_AssetPack_0290_AlchemySoundEffectsToyPercussion"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0290_AlchemySoundEffectsToyPercussion.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0290_AlchemySoundEffectsToyPercussion.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0290_AlchemySoundEffectsToyPercussion"
end
