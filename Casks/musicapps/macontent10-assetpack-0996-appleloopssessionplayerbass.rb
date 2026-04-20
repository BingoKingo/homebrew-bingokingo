cask "macontent10-assetpack-0996-appleloopssessionplayerbass" do
  version "939df4f3e4b596253bafc3e068a70476-9"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0996_AppleLoopsSessionPlayerBass.pkg"
  name "MAContent10_AssetPack_0996_AppleLoopsSessionPlayerBass"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0996_AppleLoopsSessionPlayerBass.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0996_AppleLoopsSessionPlayerBass.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0996_AppleLoopsSessionPlayerBass"
end
