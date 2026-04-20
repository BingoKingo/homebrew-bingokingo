cask "macontent10-assetpack-0086-alchemysoundscapesethervent" do
  version "92d2a9da988d35d63bbe2cc2f9ce01d9-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0086_AlchemySoundscapesEtherVent.pkg"
  name "MAContent10_AssetPack_0086_AlchemySoundscapesEtherVent"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0086_AlchemySoundscapesEtherVent.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0086_AlchemySoundscapesEtherVent.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0086_AlchemySoundscapesEtherVent"
end
