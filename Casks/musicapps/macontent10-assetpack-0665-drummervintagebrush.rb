cask "macontent10-assetpack-0665-drummervintagebrush" do
  version "38cf8edad97823898a9d97761e4b5abe-263"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0665_DrummerVintageBrush.pkg"
  name "MAContent10_AssetPack_0665_DrummerVintageBrush"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0665_DrummerVintageBrush.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0665_DrummerVintageBrush.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0665_DrummerVintageBrush"
end
