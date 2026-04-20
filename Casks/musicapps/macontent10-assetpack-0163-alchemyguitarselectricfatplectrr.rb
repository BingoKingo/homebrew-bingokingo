cask "macontent10-assetpack-0163-alchemyguitarselectricfatplectrr" do
  version "cc0bd0ae742a14c003591793e1d8ee90-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0163_AlchemyGuitarsElectricFatPlectRR.pkg"
  name "MAContent10_AssetPack_0163_AlchemyGuitarsElectricFatPlectRR"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0163_AlchemyGuitarsElectricFatPlectRR.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0163_AlchemyGuitarsElectricFatPlectRR.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0163_AlchemyGuitarsElectricFatPlectRR"
end
