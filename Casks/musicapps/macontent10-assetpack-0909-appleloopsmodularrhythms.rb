cask "macontent10-assetpack-0909-appleloopsmodularrhythms" do
  version "8aa15d144c2cff0d261a72ec513413fd-15"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0909_AppleLoopsModularRhythms.pkg"
  name "MAContent10_AssetPack_0909_AppleLoopsModularRhythms"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0909_AppleLoopsModularRhythms.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0909_AppleLoopsModularRhythms.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0909_AppleLoopsModularRhythms"
end
