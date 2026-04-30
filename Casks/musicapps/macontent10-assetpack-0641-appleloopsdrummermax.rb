cask "macontent10-assetpack-0641-appleloopsdrummermax" do
  version "6e1f4fce006e2bb8c20d1343e36e8189"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0641_AppleLoopsDrummerMax.pkg"
  name "MAContent10_AssetPack_0641_AppleLoopsDrummerMax"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0641_AppleLoopsDrummerMax.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0641_AppleLoopsDrummerMax.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0641_AppleLoopsDrummerMax"
end
