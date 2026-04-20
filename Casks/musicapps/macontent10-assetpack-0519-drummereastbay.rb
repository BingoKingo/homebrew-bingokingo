cask "macontent10-assetpack-0519-drummereastbay" do
  version "0a53db7cf357fdf0be6fbaa990d534b0-38"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0519_DrummerEastBay.pkg"
  name "MAContent10_AssetPack_0519_DrummerEastBay"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0519_DrummerEastBay.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0519_DrummerEastBay.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0519_DrummerEastBay"
end
