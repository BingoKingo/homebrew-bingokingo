cask "macontent10-assetpack-0187-alchemyguitarselectricsoftcrunchy" do
  version "81ab184d1293a6ed27b722b460cb0dea-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0187_AlchemyGuitarsElectricSoftCrunchy.pkg"
  name "MAContent10_AssetPack_0187_AlchemyGuitarsElectricSoftCrunchy"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0187_AlchemyGuitarsElectricSoftCrunchy.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0187_AlchemyGuitarsElectricSoftCrunchy.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0187_AlchemyGuitarsElectricSoftCrunchy"
end
