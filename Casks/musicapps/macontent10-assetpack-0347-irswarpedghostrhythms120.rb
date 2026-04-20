cask "macontent10-assetpack-0347-irswarpedghostrhythms120" do
  version "c2228e8308bfd0c39033dc88b5574ca6-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0347_IRsWarpedGhostRhythms120.pkg"
  name "MAContent10_AssetPack_0347_IRsWarpedGhostRhythms120"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0347_IRsWarpedGhostRhythms120.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0347_IRsWarpedGhostRhythms120.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0347_IRsWarpedGhostRhythms120"
end
