cask "macontent10-assetpack-0805-irslegacy" do
  version "1b40af3624a7ef197d67fb09a0645294"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0805_IRsLegacy.pkg"
  name "MAContent10_AssetPack_0805_IRsLegacy"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0805_IRsLegacy.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0805_IRsLegacy.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0805_IRsLegacy"
end
