cask "macontent10-assetpack-0970-drummersocal-v2" do
  version "abc5a12b8e134414e76ccc5febb5d103-20"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0970_DrummerSoCal_v2.pkg"
  name "MAContent10_AssetPack_0970_DrummerSoCal_v2"
  desc "IsEssentialAddition"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0970_DrummerSoCal_v2.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0970_DrummerSoCal_v2.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0970_DrummerSoCal_v2"
end
