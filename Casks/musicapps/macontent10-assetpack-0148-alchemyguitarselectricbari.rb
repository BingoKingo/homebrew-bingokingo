cask "macontent10-assetpack-0148-alchemyguitarselectricbari" do
  version "d57a690db4a1c1dc52399e69f3b314a6-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0148_AlchemyGuitarsElectricBari.pkg"
  name "MAContent10_AssetPack_0148_AlchemyGuitarsElectricBari"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0148_AlchemyGuitarsElectricBari.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0148_AlchemyGuitarsElectricBari.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0148_AlchemyGuitarsElectricBari"
end
