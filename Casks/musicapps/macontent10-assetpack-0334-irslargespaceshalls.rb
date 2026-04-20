cask "macontent10-assetpack-0334-irslargespaceshalls" do
  version "861ae89ffe2eefd28bc74063c0928296-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0334_IRsLargeSpacesHalls.pkg"
  name "MAContent10_AssetPack_0334_IRsLargeSpacesHalls"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0334_IRsLargeSpacesHalls.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0334_IRsLargeSpacesHalls.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0334_IRsLargeSpacesHalls"
end
