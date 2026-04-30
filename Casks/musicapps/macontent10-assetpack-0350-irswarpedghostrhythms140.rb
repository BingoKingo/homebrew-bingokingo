cask "macontent10-assetpack-0350-irswarpedghostrhythms140" do
  version "2aee860a7c36664df4a358b3b16f1a26-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0350_IRsWarpedGhostRhythms140.pkg"
  name "MAContent10_AssetPack_0350_IRsWarpedGhostRhythms140"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0350_IRsWarpedGhostRhythms140.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0350_IRsWarpedGhostRhythms140.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0350_IRsWarpedGhostRhythms140"
end
