cask "macontent10-assetpack-0630-appleloopsdrummerbenny" do
  version "194a4e483f2091399165aa315b85f19a"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0630_AppleLoopsDrummerBenny.pkg"
  name "MAContent10_AssetPack_0630_AppleLoopsDrummerBenny"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0630_AppleLoopsDrummerBenny.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0630_AppleLoopsDrummerBenny.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0630_AppleLoopsDrummerBenny"
end
