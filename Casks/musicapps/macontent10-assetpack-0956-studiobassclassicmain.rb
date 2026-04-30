cask "macontent10-assetpack-0956-studiobassclassicmain" do
  version "29df8b75cd6b752ee42d5523c26b8042-55"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0956_StudioBassClassicMain.pkg"
  name "MAContent10_AssetPack_0956_StudioBassClassicMain"
  desc "IsEssentialAddition"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0956_StudioBassClassicMain.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0956_StudioBassClassicMain.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0956_StudioBassClassicMain"
end
