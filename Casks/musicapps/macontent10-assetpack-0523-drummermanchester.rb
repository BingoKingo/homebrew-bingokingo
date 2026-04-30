cask "macontent10-assetpack-0523-drummermanchester" do
  version "e82a4ea8cb53da0df1bf916e30230ae3-43"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0523_DrummerManchester.pkg"
  name "MAContent10_AssetPack_0523_DrummerManchester"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0523_DrummerManchester.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0523_DrummerManchester.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0523_DrummerManchester"
end
