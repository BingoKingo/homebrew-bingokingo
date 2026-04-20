cask "macontent10-assetpack-0186-alchemyguitarselectricsmooth" do
  version "ecef6077be6d585f8b507a870aa97394-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0186_AlchemyGuitarsElectricSmooth.pkg"
  name "MAContent10_AssetPack_0186_AlchemyGuitarsElectricSmooth"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0186_AlchemyGuitarsElectricSmooth.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0186_AlchemyGuitarsElectricSmooth.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0186_AlchemyGuitarsElectricSmooth"
end
