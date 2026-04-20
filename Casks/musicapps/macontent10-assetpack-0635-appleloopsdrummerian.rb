cask "macontent10-assetpack-0635-appleloopsdrummerian" do
  version "4c46b3412a66ab7f19f7946815ae310a"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0635_AppleLoopsDrummerIan.pkg"
  name "MAContent10_AssetPack_0635_AppleLoopsDrummerIan"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0635_AppleLoopsDrummerIan.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0635_AppleLoopsDrummerIan.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0635_AppleLoopsDrummerIan"
end
