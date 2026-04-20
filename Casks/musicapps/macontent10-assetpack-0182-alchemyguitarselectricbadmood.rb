cask "macontent10-assetpack-0182-alchemyguitarselectricbadmood" do
  version "340765a0bc42976363c174e8f1001c1d-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0182_AlchemyGuitarsElectricBadMood.pkg"
  name "MAContent10_AssetPack_0182_AlchemyGuitarsElectricBadMood"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0182_AlchemyGuitarsElectricBadMood.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0182_AlchemyGuitarsElectricBadMood.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0182_AlchemyGuitarsElectricBadMood"
end
