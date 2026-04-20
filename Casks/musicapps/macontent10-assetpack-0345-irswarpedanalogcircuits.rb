cask "macontent10-assetpack-0345-irswarpedanalogcircuits" do
  version "eb6b0119e10e874297a4355bdf3a4d05"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0345_IRsWarpedAnalogCircuits.pkg"
  name "MAContent10_AssetPack_0345_IRsWarpedAnalogCircuits"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0345_IRsWarpedAnalogCircuits.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0345_IRsWarpedAnalogCircuits.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0345_IRsWarpedAnalogCircuits"
end
