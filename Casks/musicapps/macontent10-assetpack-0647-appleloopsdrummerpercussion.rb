cask "macontent10-assetpack-0647-appleloopsdrummerpercussion" do
  version "1b3abe1b4fb22fa60690ffe15184f69a-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0647_AppleLoopsDrummerPercussion.pkg"
  name "MAContent10_AssetPack_0647_AppleLoopsDrummerPercussion"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0647_AppleLoopsDrummerPercussion.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0647_AppleLoopsDrummerPercussion.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0647_AppleLoopsDrummerPercussion"
end
