cask "macontent10-assetpack-0636-appleloopsdrummerjesse" do
  version "039b89f4b4304cc1152b8ed498b9f953"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0636_AppleLoopsDrummerJesse.pkg"
  name "MAContent10_AssetPack_0636_AppleLoopsDrummerJesse"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0636_AppleLoopsDrummerJesse.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0636_AppleLoopsDrummerJesse.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0636_AppleLoopsDrummerJesse"
end
