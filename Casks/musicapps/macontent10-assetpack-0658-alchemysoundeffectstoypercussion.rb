cask "macontent10-assetpack-0658-alchemysoundeffectstoypercussion" do
  version "4e3f51e6b1927117473115ebbe2703d6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0658_AlchemySoundEffectsToyPercussion.pkg"
  name "MAContent10_AssetPack_0658_AlchemySoundEffectsToyPercussion"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0658_AlchemySoundEffectsToyPercussion.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0658_AlchemySoundEffectsToyPercussion.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0658_AlchemySoundEffectsToyPercussion"
end
