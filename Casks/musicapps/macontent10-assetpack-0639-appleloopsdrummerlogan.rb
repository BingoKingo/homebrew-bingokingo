cask "macontent10-assetpack-0639-appleloopsdrummerlogan" do
  version "cee60f6e9870d9cba1c913d10d33c27e"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0639_AppleLoopsDrummerLogan.pkg"
  name "MAContent10_AssetPack_0639_AppleLoopsDrummerLogan"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0639_AppleLoopsDrummerLogan.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0639_AppleLoopsDrummerLogan.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0639_AppleLoopsDrummerLogan"
end
