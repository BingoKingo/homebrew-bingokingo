cask "macontent10-assetpack-0980-drummerneosoul-v2" do
  version "e42b0eb465531b90e411407147c3b109-13"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0980_DrummerNeoSoul_v2.pkg"
  name "MAContent10_AssetPack_0980_DrummerNeoSoul_v2"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0980_DrummerNeoSoul_v2.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0980_DrummerNeoSoul_v2.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0980_DrummerNeoSoul_v2"
end
