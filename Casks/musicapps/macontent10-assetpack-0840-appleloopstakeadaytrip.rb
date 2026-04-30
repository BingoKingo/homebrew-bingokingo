cask "macontent10-assetpack-0840-appleloopstakeadaytrip" do
  version "bb6910b6e4e8de1ccb017f8643c3bb29-10"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0840_AppleLoopsTakeADaytrip.pkg"
  name "MAContent10_AssetPack_0840_AppleLoopsTakeADaytrip"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0840_AppleLoopsTakeADaytrip.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0840_AppleLoopsTakeADaytrip.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0840_AppleLoopsTakeADaytrip"
end
