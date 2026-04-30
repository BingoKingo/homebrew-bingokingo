cask "macontent10-assetpack-0871-appleloopstrakgirl" do
  version "1ddfa51175a09745e60859421e5608cb-9"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0871_AppleLoopsTrakgirl.pkg"
  name "MAContent10_AssetPack_0871_AppleLoopsTrakgirl"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0871_AppleLoopsTrakgirl.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0871_AppleLoopsTrakgirl.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0871_AppleLoopsTrakgirl"
end
