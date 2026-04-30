cask "macontent10-assetpack-0574-drummerliverpoollogic" do
  version "9aaa3b6b9715778fd626c369ea7c18ac-7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0574_DrummerLiverpoolLogic.pkg"
  name "MAContent10_AssetPack_0574_DrummerLiverpoolLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0574_DrummerLiverpoolLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0574_DrummerLiverpoolLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0574_DrummerLiverpoolLogic"
end
