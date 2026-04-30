cask "macontent10-assetpack-0525-drummerneosoul" do
  version "76f17fa877f081c922cc6de0c589f420-48"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0525_DrummerNeoSoul.pkg"
  name "MAContent10_AssetPack_0525_DrummerNeoSoul"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0525_DrummerNeoSoul.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0525_DrummerNeoSoul.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0525_DrummerNeoSoul"
end
