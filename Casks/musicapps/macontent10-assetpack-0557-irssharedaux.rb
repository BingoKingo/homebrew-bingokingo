cask "macontent10-assetpack-0557-irssharedaux" do
  version "4b634ce86775acef4ecd34b74ad63cc4-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0557_IRsSharedAUX.pkg"
  name "MAContent10_AssetPack_0557_IRsSharedAUX"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0557_IRsSharedAUX.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0557_IRsSharedAUX.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0557_IRsSharedAUX"
end
