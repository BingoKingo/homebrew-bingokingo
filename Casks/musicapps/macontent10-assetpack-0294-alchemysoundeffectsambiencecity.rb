cask "macontent10-assetpack-0294-alchemysoundeffectsambiencecity" do
  version "c43fd5d3ffbd01115556ac93f6dd7848-13"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0294_AlchemySoundEffectsAmbienceCity.pkg"
  name "MAContent10_AssetPack_0294_AlchemySoundEffectsAmbienceCity"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0294_AlchemySoundEffectsAmbienceCity.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0294_AlchemySoundEffectsAmbienceCity.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0294_AlchemySoundEffectsAmbienceCity"
end
