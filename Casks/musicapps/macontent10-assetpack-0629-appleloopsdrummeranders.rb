cask "macontent10-assetpack-0629-appleloopsdrummeranders" do
  version "089666f53d442a49495b08e5d097c93b"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0629_AppleLoopsDrummerAnders.pkg"
  name "MAContent10_AssetPack_0629_AppleLoopsDrummerAnders"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0629_AppleLoopsDrummerAnders.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0629_AppleLoopsDrummerAnders.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0629_AppleLoopsDrummerAnders"
end
