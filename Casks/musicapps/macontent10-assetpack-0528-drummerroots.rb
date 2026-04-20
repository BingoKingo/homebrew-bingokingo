cask "macontent10-assetpack-0528-drummerroots" do
  version "b1c1cdf741388b3f9ff375d2ccaeec85-41"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0528_DrummerRoots.pkg"
  name "MAContent10_AssetPack_0528_DrummerRoots"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0528_DrummerRoots.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0528_DrummerRoots.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0528_DrummerRoots"
end
