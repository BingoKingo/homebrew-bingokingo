cask "macontent10-assetpack-0640-appleloopsdrummermason" do
  version "29b147bdf44bd01bb982134124369e9d"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0640_AppleLoopsDrummerMason.pkg"
  name "MAContent10_AssetPack_0640_AppleLoopsDrummerMason"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0640_AppleLoopsDrummerMason.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0640_AppleLoopsDrummerMason.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0640_AppleLoopsDrummerMason"
end
