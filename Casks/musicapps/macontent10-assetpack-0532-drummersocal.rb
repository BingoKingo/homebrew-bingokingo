cask "macontent10-assetpack-0532-drummersocal" do
  version "dd164a07435ed62b1cec023194f921e9-38"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0532_DrummerSoCal.pkg"
  name "MAContent10_AssetPack_0532_DrummerSoCal"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0532_DrummerSoCal.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0532_DrummerSoCal.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0532_DrummerSoCal"
end
