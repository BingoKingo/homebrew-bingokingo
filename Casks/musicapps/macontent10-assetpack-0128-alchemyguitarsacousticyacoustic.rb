cask "macontent10-assetpack-0128-alchemyguitarsacousticyacoustic" do
  version "4317a6979303f2b5f0796489405f655a-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0128_AlchemyGuitarsAcousticYAcoustic.pkg"
  name "MAContent10_AssetPack_0128_AlchemyGuitarsAcousticYAcoustic"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0128_AlchemyGuitarsAcousticYAcoustic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0128_AlchemyGuitarsAcousticYAcoustic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0128_AlchemyGuitarsAcousticYAcoustic"
end
