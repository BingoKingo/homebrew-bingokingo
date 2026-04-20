cask "macontent10-assetpack-0517-drummerbrooklyn" do
  version "81659168a6c9e48c5603ddbe5690a2d2-43"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0517_DrummerBrooklyn.pkg"
  name "MAContent10_AssetPack_0517_DrummerBrooklyn"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0517_DrummerBrooklyn.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0517_DrummerBrooklyn.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0517_DrummerBrooklyn"
end
