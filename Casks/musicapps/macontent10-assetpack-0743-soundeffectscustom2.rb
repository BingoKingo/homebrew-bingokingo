cask "macontent10-assetpack-0743-soundeffectscustom2" do
  version "cedc3c536891d20572f8ef2d1969026c-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0743_SoundEffectsCustom2.pkg"
  name "MAContent10_AssetPack_0743_SoundEffectsCustom2"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0743_SoundEffectsCustom2.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0743_SoundEffectsCustom2.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0743_SoundEffectsCustom2"
end
