cask "macontent10-assetpack-0072-alchemysoundscapesrelevent" do
  version "83d71505003e4bd95a64a0d04a9da1e2-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0072_AlchemySoundscapesRelevent.pkg"
  name "MAContent10_AssetPack_0072_AlchemySoundscapesRelevent"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0072_AlchemySoundscapesRelevent.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0072_AlchemySoundscapesRelevent.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0072_AlchemySoundscapesRelevent"
end
