cask "macontent10-assetpack-0521-drummerheavy" do
  version "bfc556842c15072b0ed34baff14c638f-44"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0521_DrummerHeavy.pkg"
  name "MAContent10_AssetPack_0521_DrummerHeavy"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0521_DrummerHeavy.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0521_DrummerHeavy.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0521_DrummerHeavy"
end
