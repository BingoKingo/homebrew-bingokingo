cask "macontent10-assetpack-0188-alchemyguitarselectrictremolo" do
  version "c11222c1b4f15b56bf4d1d5288327f56"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0188_AlchemyGuitarsElectricTremolo.pkg"
  name "MAContent10_AssetPack_0188_AlchemyGuitarsElectricTremolo"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0188_AlchemyGuitarsElectricTremolo.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0188_AlchemyGuitarsElectricTremolo.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0188_AlchemyGuitarsElectricTremolo"
end
