cask "macontent10-assetpack-0775-appleloopsvisionandverse2" do
  version "b50c8bc4256833a7e1b2ea91d60fe4de-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0775_AppleLoopsVisionAndVerse2.pkg"
  name "MAContent10_AssetPack_0775_AppleLoopsVisionAndVerse2"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0775_AppleLoopsVisionAndVerse2.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0775_AppleLoopsVisionAndVerse2.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0775_AppleLoopsVisionAndVerse2"
end
