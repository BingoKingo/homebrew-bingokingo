cask "macontent10-assetpack-0533-drummersunset" do
  version "3c8ece98050230d0042fdfaebc2a281c-43"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0533_DrummerSunset.pkg"
  name "MAContent10_AssetPack_0533_DrummerSunset"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0533_DrummerSunset.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0533_DrummerSunset.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0533_DrummerSunset"
end
