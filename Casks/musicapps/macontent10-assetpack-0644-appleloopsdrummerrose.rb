cask "macontent10-assetpack-0644-appleloopsdrummerrose" do
  version "646cae4f9dedd2ab8a119a5c93b43391"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0644_AppleLoopsDrummerRose.pkg"
  name "MAContent10_AssetPack_0644_AppleLoopsDrummerRose"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0644_AppleLoopsDrummerRose.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0644_AppleLoopsDrummerRose.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0644_AppleLoopsDrummerRose"
end
