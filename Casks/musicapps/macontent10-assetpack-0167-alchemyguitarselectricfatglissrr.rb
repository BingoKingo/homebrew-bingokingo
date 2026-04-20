cask "macontent10-assetpack-0167-alchemyguitarselectricfatglissrr" do
  version "3cc65bf24dd4fa4789530d08ae0b75d3-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0167_AlchemyGuitarsElectricFatGlissRR.pkg"
  name "MAContent10_AssetPack_0167_AlchemyGuitarsElectricFatGlissRR"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0167_AlchemyGuitarsElectricFatGlissRR.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0167_AlchemyGuitarsElectricFatGlissRR.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0167_AlchemyGuitarsElectricFatGlissRR"
end
