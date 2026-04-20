cask "macontent10-assetpack-0562-drummerbluebirdlogic" do
  version "239422d59a7396e55a5daaa348ed8c6a-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0562_DrummerBluebirdLogic.pkg"
  name "MAContent10_AssetPack_0562_DrummerBluebirdLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0562_DrummerBluebirdLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0562_DrummerBluebirdLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0562_DrummerBluebirdLogic"
end
