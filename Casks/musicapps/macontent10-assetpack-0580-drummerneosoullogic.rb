cask "macontent10-assetpack-0580-drummerneosoullogic" do
  version "62746952a8a14884f8ffd7dae66c60db-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0580_DrummerNeoSoulLogic.pkg"
  name "MAContent10_AssetPack_0580_DrummerNeoSoulLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0580_DrummerNeoSoulLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0580_DrummerNeoSoulLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0580_DrummerNeoSoulLogic"
end
