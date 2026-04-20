cask "macontent10-assetpack-0508-exs-stringsfull" do
  version "ee2b0606cc15c733a681a5f6912d94f4-87"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0508_EXS_StringsFull.pkg"
  name "MAContent10_AssetPack_0508_EXS_StringsFull"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0508_EXS_StringsFull.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0508_EXS_StringsFull.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0508_EXS_StringsFull"
end
