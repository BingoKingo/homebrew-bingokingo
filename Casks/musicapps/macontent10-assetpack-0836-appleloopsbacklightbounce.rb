cask "macontent10-assetpack-0836-appleloopsbacklightbounce" do
  version "f98fd308caea10cf5d8b5c7236b1b2e8-10"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0836_AppleLoopsBacklightBounce.pkg"
  name "MAContent10_AssetPack_0836_AppleLoopsBacklightBounce"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0836_AppleLoopsBacklightBounce.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0836_AppleLoopsBacklightBounce.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0836_AppleLoopsBacklightBounce"
end
