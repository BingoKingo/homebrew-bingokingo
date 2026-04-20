cask "macontent10-assetpack-0704-appleloopshiphop" do
  version "eb492e1f4d0cf5cdffaeb1c74a57ee1b-13"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0704_AppleLoopsHipHop.pkg"
  name "MAContent10_AssetPack_0704_AppleLoopsHipHop"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0704_AppleLoopsHipHop.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0704_AppleLoopsHipHop.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0704_AppleLoopsHipHop"
end
