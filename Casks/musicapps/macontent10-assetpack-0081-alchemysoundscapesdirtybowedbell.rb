cask "macontent10-assetpack-0081-alchemysoundscapesdirtybowedbell" do
  version "f21bd0a08b449de11cc2dd84ea69768b-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0081_AlchemySoundscapesDirtyBowedBell.pkg"
  name "MAContent10_AssetPack_0081_AlchemySoundscapesDirtyBowedBell"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0081_AlchemySoundscapesDirtyBowedBell.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0081_AlchemySoundscapesDirtyBowedBell.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0081_AlchemySoundscapesDirtyBowedBell"
end
