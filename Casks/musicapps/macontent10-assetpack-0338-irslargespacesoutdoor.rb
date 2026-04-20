cask "macontent10-assetpack-0338-irslargespacesoutdoor" do
  version "a75386b603129009b95907e4eb4dfeeb-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0338_IRsLargeSpacesOutdoor.pkg"
  name "MAContent10_AssetPack_0338_IRsLargeSpacesOutdoor"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0338_IRsLargeSpacesOutdoor.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0338_IRsLargeSpacesOutdoor.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0338_IRsLargeSpacesOutdoor"
end
