cask "macontent10-assetpack-0726-appleloopstoybox" do
  version "739b5c118cbe53f4c9cc083ad05d0dda-7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0726_AppleLoopsToyBox.pkg"
  name "MAContent10_AssetPack_0726_AppleLoopsToyBox"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0726_AppleLoopsToyBox.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0726_AppleLoopsToyBox.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0726_AppleLoopsToyBox"
end
