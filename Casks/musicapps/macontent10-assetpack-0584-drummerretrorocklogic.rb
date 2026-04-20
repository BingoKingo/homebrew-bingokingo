cask "macontent10-assetpack-0584-drummerretrorocklogic" do
  version "7b93cbe713063999608fe2d144f51d31-7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0584_DrummerRetroRockLogic.pkg"
  name "MAContent10_AssetPack_0584_DrummerRetroRockLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0584_DrummerRetroRockLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0584_DrummerRetroRockLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0584_DrummerRetroRockLogic"
end
