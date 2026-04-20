cask "macontent10-assetpack-0175-alchemyguitarselectricbowed" do
  version "cb049e50b5f8ae044a198a4def34aa31-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0175_AlchemyGuitarsElectricBowed.pkg"
  name "MAContent10_AssetPack_0175_AlchemyGuitarsElectricBowed"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0175_AlchemyGuitarsElectricBowed.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0175_AlchemyGuitarsElectricBowed.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0175_AlchemyGuitarsElectricBowed"
end
