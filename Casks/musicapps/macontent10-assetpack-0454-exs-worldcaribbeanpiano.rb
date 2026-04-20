cask "macontent10-assetpack-0454-exs-worldcaribbeanpiano" do
  version "48edd4fe4a304afaaeb7f4b121982387-25"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0454_EXS_WorldCaribbeanPiano.pkg"
  name "MAContent10_AssetPack_0454_EXS_WorldCaribbeanPiano"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0454_EXS_WorldCaribbeanPiano.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0454_EXS_WorldCaribbeanPiano.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0454_EXS_WorldCaribbeanPiano"
end
