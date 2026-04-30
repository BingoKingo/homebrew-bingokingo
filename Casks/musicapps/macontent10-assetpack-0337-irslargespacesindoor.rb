cask "macontent10-assetpack-0337-irslargespacesindoor" do
  version "a9bdd4f7badd18c112ef8df94c53e371-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0337_IRsLargeSpacesIndoor.pkg"
  name "MAContent10_AssetPack_0337_IRsLargeSpacesIndoor"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0337_IRsLargeSpacesIndoor.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0337_IRsLargeSpacesIndoor.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0337_IRsLargeSpacesIndoor"
end
