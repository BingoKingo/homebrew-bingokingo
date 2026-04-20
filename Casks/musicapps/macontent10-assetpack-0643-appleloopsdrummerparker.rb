cask "macontent10-assetpack-0643-appleloopsdrummerparker" do
  version "47af19550c7e97bf406023495d71cb30"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0643_AppleLoopsDrummerParker.pkg"
  name "MAContent10_AssetPack_0643_AppleLoopsDrummerParker"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0643_AppleLoopsDrummerParker.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0643_AppleLoopsDrummerParker.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0643_AppleLoopsDrummerParker"
end
