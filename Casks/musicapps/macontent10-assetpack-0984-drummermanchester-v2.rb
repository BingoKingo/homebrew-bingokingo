cask "macontent10-assetpack-0984-drummermanchester-v2" do
  version "f48f998ba7fc937f143ef7bd0ad48c4a-21"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0984_DrummerManchester_v2.pkg"
  name "MAContent10_AssetPack_0984_DrummerManchester_v2"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0984_DrummerManchester_v2.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0984_DrummerManchester_v2.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0984_DrummerManchester_v2"
end
