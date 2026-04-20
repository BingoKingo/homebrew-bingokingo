cask "macontent10-assetpack-0632-appleloopsdrummerdarcy" do
  version "8ac7bb5d22a7ef7f0dc2eb9cf20746da"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0632_AppleLoopsDrummerDarcy.pkg"
  name "MAContent10_AssetPack_0632_AppleLoopsDrummerDarcy"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0632_AppleLoopsDrummerDarcy.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0632_AppleLoopsDrummerDarcy.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0632_AppleLoopsDrummerDarcy"
end
