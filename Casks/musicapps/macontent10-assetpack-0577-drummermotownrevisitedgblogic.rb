cask "macontent10-assetpack-0577-drummermotownrevisitedgblogic" do
  version "36640ab2a633c6219a20c29263786f85-36"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0577_DrummerMotownRevisitedGBLogic.pkg"
  name "MAContent10_AssetPack_0577_DrummerMotownRevisitedGBLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0577_DrummerMotownRevisitedGBLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0577_DrummerMotownRevisitedGBLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0577_DrummerMotownRevisitedGBLogic"
end
