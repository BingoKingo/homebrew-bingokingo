cask "macontent10-assetpack-0159-alchemyguitarselectricmagnetbow" do
  version "fbbf935eaa12558c2cc8d3bd5aeb8f91-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0159_AlchemyGuitarsElectricMagnetBow.pkg"
  name "MAContent10_AssetPack_0159_AlchemyGuitarsElectricMagnetBow"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0159_AlchemyGuitarsElectricMagnetBow.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0159_AlchemyGuitarsElectricMagnetBow.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0159_AlchemyGuitarsElectricMagnetBow"
end
