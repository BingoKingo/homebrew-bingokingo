cask "macontent10-assetpack-0319-appleloopsdeephouse" do
  version "ea0caaf8a1af899cad3b301b860d55d0-7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0319_AppleLoopsDeepHouse.pkg"
  name "MAContent10_AssetPack_0319_AppleLoopsDeepHouse"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0319_AppleLoopsDeepHouse.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0319_AppleLoopsDeepHouse.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0319_AppleLoopsDeepHouse"
end
