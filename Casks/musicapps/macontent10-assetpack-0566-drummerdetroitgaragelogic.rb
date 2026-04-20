cask "macontent10-assetpack-0566-drummerdetroitgaragelogic" do
  version "41f6c6c88a77b420c0fcba5f056015ea-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0566_DrummerDetroitGarageLogic.pkg"
  name "MAContent10_AssetPack_0566_DrummerDetroitGarageLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0566_DrummerDetroitGarageLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0566_DrummerDetroitGarageLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0566_DrummerDetroitGarageLogic"
end
