cask "macontent10-assetpack-0586-drummerrootslogic" do
  version "edccadde66670643f3348905cd0bfb22-7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0586_DrummerRootsLogic.pkg"
  name "MAContent10_AssetPack_0586_DrummerRootsLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0586_DrummerRootsLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0586_DrummerRootsLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0586_DrummerRootsLogic"
end
