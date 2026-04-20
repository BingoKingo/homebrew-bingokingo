cask "macontent10-assetpack-0561-drummerbluebirdgblogic" do
  version "d1ce28050c901a715cc9ceb7d4456c13-36"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0561_DrummerBluebirdGBLogic.pkg"
  name "MAContent10_AssetPack_0561_DrummerBluebirdGBLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0561_DrummerBluebirdGBLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0561_DrummerBluebirdGBLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0561_DrummerBluebirdGBLogic"
end
