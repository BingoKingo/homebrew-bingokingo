cask "macontent10-assetpack-0943-appleloopscorywong" do
  version "66b9f14c74070614e0fc47734ffea94e-13"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0943_AppleLoopsCoryWong.pkg"
  name "MAContent10_AssetPack_0943_AppleLoopsCoryWong"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0943_AppleLoopsCoryWong.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0943_AppleLoopsCoryWong.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0943_AppleLoopsCoryWong"
end
