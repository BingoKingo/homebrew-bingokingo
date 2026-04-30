cask "macontent10-assetpack-0582-drummerportlandlogic" do
  version "60e8170f45a54f4b0e22c1f4e4353d5d-7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0582_DrummerPortlandLogic.pkg"
  name "MAContent10_AssetPack_0582_DrummerPortlandLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0582_DrummerPortlandLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0582_DrummerPortlandLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0582_DrummerPortlandLogic"
end
