cask "macontent10-assetpack-0288-alchemysoundeffectsimpacts" do
  version "f2cd1bea593c301efa08704e0cccf618-18"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0288_AlchemySoundEffectsImpacts.pkg"
  name "MAContent10_AssetPack_0288_AlchemySoundEffectsImpacts"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0288_AlchemySoundEffectsImpacts.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0288_AlchemySoundEffectsImpacts.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0288_AlchemySoundEffectsImpacts"
end
