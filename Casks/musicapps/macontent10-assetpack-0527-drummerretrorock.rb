cask "macontent10-assetpack-0527-drummerretrorock" do
  version "e7520817915cef9eb330215b77ed6bc9-45"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0527_DrummerRetroRock.pkg"
  name "MAContent10_AssetPack_0527_DrummerRetroRock"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0527_DrummerRetroRock.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0527_DrummerRetroRock.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0527_DrummerRetroRock"
end
