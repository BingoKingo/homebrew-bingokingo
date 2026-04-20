cask "macontent10-assetpack-0336-irslargespacessprings" do
  version "71784f2f62d4f0c0fcac4bd5dd195683-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0336_IRsLargeSpacesSprings.pkg"
  name "MAContent10_AssetPack_0336_IRsLargeSpacesSprings"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0336_IRsLargeSpacesSprings.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0336_IRsLargeSpacesSprings.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0336_IRsLargeSpacesSprings"
end
