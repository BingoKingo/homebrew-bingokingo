cask "macontent10-assetpack-0318-appleloopstechhouse" do
  version "f8116f2f1781de7aa5a03431cd5fdf04-11"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0318_AppleLoopsTechHouse.pkg"
  name "MAContent10_AssetPack_0318_AppleLoopsTechHouse"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0318_AppleLoopsTechHouse.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0318_AppleLoopsTechHouse.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0318_AppleLoopsTechHouse"
end
