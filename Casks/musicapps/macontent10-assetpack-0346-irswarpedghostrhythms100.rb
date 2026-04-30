cask "macontent10-assetpack-0346-irswarpedghostrhythms100" do
  version "1b56eb2731e44e6d82e3b529f87e3af3-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0346_IRsWarpedGhostRhythms100.pkg"
  name "MAContent10_AssetPack_0346_IRsWarpedGhostRhythms100"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0346_IRsWarpedGhostRhythms100.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0346_IRsWarpedGhostRhythms100.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0346_IRsWarpedGhostRhythms100"
end
