cask "macontent10-assetpack-0293-alchemysoundeffectstechnology" do
  version "70e6b42e908814b4363b140ab354264e-12"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0293_AlchemySoundEffectsTechnology.pkg"
  name "MAContent10_AssetPack_0293_AlchemySoundEffectsTechnology"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0293_AlchemySoundEffectsTechnology.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0293_AlchemySoundEffectsTechnology.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0293_AlchemySoundEffectsTechnology"
end
