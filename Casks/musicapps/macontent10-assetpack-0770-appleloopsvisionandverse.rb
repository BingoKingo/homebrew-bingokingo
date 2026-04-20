cask "macontent10-assetpack-0770-appleloopsvisionandverse" do
  version "413fcb501b33f3e253ebe4f317608539-12"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0770_AppleLoopsVisionAndVerse.pkg"
  name "MAContent10_AssetPack_0770_AppleLoopsVisionAndVerse"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0770_AppleLoopsVisionAndVerse.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0770_AppleLoopsVisionAndVerse.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0770_AppleLoopsVisionAndVerse"
end
