cask "macontent10-assetpack-0589-drummerslowjamgblogic" do
  version "a5a0cc475b3d60d347cbd5182fb922a0-39"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0589_DrummerSlowJamGBLogic.pkg"
  name "MAContent10_AssetPack_0589_DrummerSlowJamGBLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0589_DrummerSlowJamGBLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0589_DrummerSlowJamGBLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0589_DrummerSlowJamGBLogic"
end
