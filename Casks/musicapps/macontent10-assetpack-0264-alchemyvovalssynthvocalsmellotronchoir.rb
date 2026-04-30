cask "macontent10-assetpack-0264-alchemyvovalssynthvocalsmellotronchoir" do
  version "b540b6a6ba22c048b6dd1b7bafc88aaf-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0264_AlchemyVovalsSynthVocalsMellotronChoir.pkg"
  name "MAContent10_AssetPack_0264_AlchemyVovalsSynthVocalsMellotronChoir"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0264_AlchemyVovalsSynthVocalsMellotronChoir.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0264_AlchemyVovalsSynthVocalsMellotronChoir.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0264_AlchemyVovalsSynthVocalsMellotronChoir"
end
