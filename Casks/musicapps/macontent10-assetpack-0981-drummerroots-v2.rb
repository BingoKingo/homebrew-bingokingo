cask "macontent10-assetpack-0981-drummerroots-v2" do
  version "57a0e84fb8cea99fc34c9599fb2f4880-18"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0981_DrummerRoots_v2.pkg"
  name "MAContent10_AssetPack_0981_DrummerRoots_v2"
  desc "IsEssentialAddition"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0981_DrummerRoots_v2.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0981_DrummerRoots_v2.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0981_DrummerRoots_v2"
end
