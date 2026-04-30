cask "macontent10-assetpack-0882-appleloopssoulection" do
  version "aef96882952991c1fd4d8f5d857a8442-21"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0882_AppleLoopsSoulection.pkg"
  name "MAContent10_AssetPack_0882_AppleLoopsSoulection"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0882_AppleLoopsSoulection.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0882_AppleLoopsSoulection.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0882_AppleLoopsSoulection"
end
