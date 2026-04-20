cask "macontent10-assetpack-0588-drummerscientificmethodlogic" do
  version "389ce9e5cb1f3cdcaf14fb344ccb1750-7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0588_DrummerScientificMethodLogic.pkg"
  name "MAContent10_AssetPack_0588_DrummerScientificMethodLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0588_DrummerScientificMethodLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0588_DrummerScientificMethodLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0588_DrummerScientificMethodLogic"
end
