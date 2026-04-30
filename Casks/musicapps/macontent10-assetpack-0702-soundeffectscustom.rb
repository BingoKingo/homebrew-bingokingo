cask "macontent10-assetpack-0702-soundeffectscustom" do
  version "0b62b5082e591150a077e318f6ef2412-19"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0702_SoundEffectsCustom.pkg"
  name "MAContent10_AssetPack_0702_SoundEffectsCustom"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0702_SoundEffectsCustom.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0702_SoundEffectsCustom.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0702_SoundEffectsCustom"
end
