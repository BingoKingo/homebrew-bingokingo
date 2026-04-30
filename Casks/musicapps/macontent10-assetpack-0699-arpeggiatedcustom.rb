cask "macontent10-assetpack-0699-arpeggiatedcustom" do
  version "49ef0841af1e349cbc76a4f674ad1a4e-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0699_ArpeggiatedCustom.pkg"
  name "MAContent10_AssetPack_0699_ArpeggiatedCustom"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0699_ArpeggiatedCustom.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0699_ArpeggiatedCustom.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0699_ArpeggiatedCustom"
end
