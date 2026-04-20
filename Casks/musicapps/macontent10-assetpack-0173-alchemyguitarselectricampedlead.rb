cask "macontent10-assetpack-0173-alchemyguitarselectricampedlead" do
  version "6ec1c6923721ba24ab7821a909c41e24-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0173_AlchemyGuitarsElectricAmpedLead.pkg"
  name "MAContent10_AssetPack_0173_AlchemyGuitarsElectricAmpedLead"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0173_AlchemyGuitarsElectricAmpedLead.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0173_AlchemyGuitarsElectricAmpedLead.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0173_AlchemyGuitarsElectricAmpedLead"
end
