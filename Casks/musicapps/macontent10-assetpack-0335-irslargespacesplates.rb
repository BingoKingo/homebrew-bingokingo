cask "macontent10-assetpack-0335-irslargespacesplates" do
  version "3896afce644637303434b056ac759070"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0335_IRsLargeSpacesPlates.pkg"
  name "MAContent10_AssetPack_0335_IRsLargeSpacesPlates"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0335_IRsLargeSpacesPlates.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0335_IRsLargeSpacesPlates.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0335_IRsLargeSpacesPlates"
end
