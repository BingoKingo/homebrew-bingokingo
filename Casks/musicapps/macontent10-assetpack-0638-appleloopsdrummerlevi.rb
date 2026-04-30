cask "macontent10-assetpack-0638-appleloopsdrummerlevi" do
  version "6bff5b0e50c114ba3c09ec97fbd13287"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0638_AppleLoopsDrummerLevi.pkg"
  name "MAContent10_AssetPack_0638_AppleLoopsDrummerLevi"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0638_AppleLoopsDrummerLevi.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0638_AppleLoopsDrummerLevi.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0638_AppleLoopsDrummerLevi"
end
