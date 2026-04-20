cask "macontent10-assetpack-0591-drummersmashgblogic" do
  version "84d18acd89beab1821d646b0d4f6d1f3-34"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0591_DrummerSmashGBLogic.pkg"
  name "MAContent10_AssetPack_0591_DrummerSmashGBLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0591_DrummerSmashGBLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0591_DrummerSmashGBLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0591_DrummerSmashGBLogic"
end
