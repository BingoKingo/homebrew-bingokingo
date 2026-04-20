cask "macontent10-assetpack-0516-drummerbluebird" do
  version "5b7633a336a4dec16b3f95b487e87815-44"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0516_DrummerBluebird.pkg"
  name "MAContent10_AssetPack_0516_DrummerBluebird"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0516_DrummerBluebird.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0516_DrummerBluebird.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0516_DrummerBluebird"
end
