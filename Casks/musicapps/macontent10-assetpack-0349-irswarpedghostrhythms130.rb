cask "macontent10-assetpack-0349-irswarpedghostrhythms130" do
  version "6dc8781b37e5521d220a6f28db511614-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0349_IRsWarpedGhostRhythms130.pkg"
  name "MAContent10_AssetPack_0349_IRsWarpedGhostRhythms130"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0349_IRsWarpedGhostRhythms130.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0349_IRsWarpedGhostRhythms130.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0349_IRsWarpedGhostRhythms130"
end
