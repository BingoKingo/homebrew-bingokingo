cask "macontent10-assetpack-0662-appleloopsdrummeraustin" do
  version "f8eb352241a0d7e461ae01e8a8d1e3f0-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0662_AppleLoopsDrummerAustin.pkg"
  name "MAContent10_AssetPack_0662_AppleLoopsDrummerAustin"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0662_AppleLoopsDrummerAustin.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0662_AppleLoopsDrummerAustin.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0662_AppleLoopsDrummerAustin"
end
