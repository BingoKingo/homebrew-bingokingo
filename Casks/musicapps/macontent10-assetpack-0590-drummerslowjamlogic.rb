cask "macontent10-assetpack-0590-drummerslowjamlogic" do
  version "5e0ec023febbdcebc830afcb561980c8-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0590_DrummerSlowJamLogic.pkg"
  name "MAContent10_AssetPack_0590_DrummerSlowJamLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0590_DrummerSlowJamLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0590_DrummerSlowJamLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0590_DrummerSlowJamLogic"
end
