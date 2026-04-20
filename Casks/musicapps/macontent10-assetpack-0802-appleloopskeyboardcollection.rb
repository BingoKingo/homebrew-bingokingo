cask "macontent10-assetpack-0802-appleloopskeyboardcollection" do
  version "b2ed2aedf3c347a8fd71fa34ed6532d3-7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0802_AppleLoopsKeyboardCollection.pkg"
  name "MAContent10_AssetPack_0802_AppleLoopsKeyboardCollection"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0802_AppleLoopsKeyboardCollection.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0802_AppleLoopsKeyboardCollection.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0802_AppleLoopsKeyboardCollection"
end
