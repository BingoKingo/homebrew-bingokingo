cask "macontent10-assetpack-0585-drummerrootsgblogic" do
  version "853bdc6095cb3dafe54ae60aacb842dc-34"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0585_DrummerRootsGBLogic.pkg"
  name "MAContent10_AssetPack_0585_DrummerRootsGBLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0585_DrummerRootsGBLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0585_DrummerRootsGBLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0585_DrummerRootsGBLogic"
end
