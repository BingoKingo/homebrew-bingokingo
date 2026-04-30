cask "macontent10-assetpack-0567-drummereastbaygblogic" do
  version "c0ef79b1a1ff072caab49990b2bd5c0b-31"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0567_DrummerEastBayGBLogic.pkg"
  name "MAContent10_AssetPack_0567_DrummerEastBayGBLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0567_DrummerEastBayGBLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0567_DrummerEastBayGBLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0567_DrummerEastBayGBLogic"
end
