cask "macontent10-assetpack-0645-appleloopsdrummerzak" do
  version "2e9d7c83d594839f33ff5aae373f2cd6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0645_AppleLoopsDrummerZak.pkg"
  name "MAContent10_AssetPack_0645_AppleLoopsDrummerZak"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0645_AppleLoopsDrummerZak.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0645_AppleLoopsDrummerZak.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0645_AppleLoopsDrummerZak"
end
