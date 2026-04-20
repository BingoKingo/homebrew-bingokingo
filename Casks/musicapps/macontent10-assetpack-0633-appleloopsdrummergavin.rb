cask "macontent10-assetpack-0633-appleloopsdrummergavin" do
  version "970773c049036e67bdfca14df85430f9"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0633_AppleLoopsDrummerGavin.pkg"
  name "MAContent10_AssetPack_0633_AppleLoopsDrummerGavin"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0633_AppleLoopsDrummerGavin.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0633_AppleLoopsDrummerGavin.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0633_AppleLoopsDrummerGavin"
end
