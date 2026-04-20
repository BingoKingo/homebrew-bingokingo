cask "macontent10-assetpack-0579-drummerneosoulgblogic" do
  version "99e9d3d0da067a90a17a591cb2ceeaf5-41"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0579_DrummerNeoSoulGBLogic.pkg"
  name "MAContent10_AssetPack_0579_DrummerNeoSoulGBLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0579_DrummerNeoSoulGBLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0579_DrummerNeoSoulGBLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0579_DrummerNeoSoulGBLogic"
end
