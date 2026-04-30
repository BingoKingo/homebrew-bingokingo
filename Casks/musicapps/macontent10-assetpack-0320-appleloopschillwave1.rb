cask "macontent10-assetpack-0320-appleloopschillwave1" do
  version "ebd0502dedf6f1a04da70fdb71eb130b-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0320_AppleLoopsChillwave1.pkg"
  name "MAContent10_AssetPack_0320_AppleLoopsChillwave1"
  desc "ContainsAppleLoops, IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0320_AppleLoopsChillwave1.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0320_AppleLoopsChillwave1.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0320_AppleLoopsChillwave1"
end
