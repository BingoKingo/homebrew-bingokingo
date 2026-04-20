cask "macontent10-assetpack-0628-appleloopsdrummeraidan" do
  version "5b865364113392558d32a334b71d8216"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0628_AppleLoopsDrummerAidan.pkg"
  name "MAContent10_AssetPack_0628_AppleLoopsDrummerAidan"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0628_AppleLoopsDrummerAidan.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0628_AppleLoopsDrummerAidan.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0628_AppleLoopsDrummerAidan"
end
