cask "macontent10-assetpack-0995-appleloopssessionplayerselection" do
  version "1966b4be25fc87b6b367193dcf18cf53-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0995_AppleLoopsSessionPlayerSelection.pkg"
  name "MAContent10_AssetPack_0995_AppleLoopsSessionPlayerSelection"
  desc "ContainsAppleLoops, IsEssentialAddition"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0995_AppleLoopsSessionPlayerSelection.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0995_AppleLoopsSessionPlayerSelection.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0995_AppleLoopsSessionPlayerSelection"
end
