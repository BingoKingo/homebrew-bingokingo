cask "macontent10-assetpack-0177-alchemyguitarselectricmodern" do
  version "6ab955b70e5bdec26c5db3562cca6d79-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0177_AlchemyGuitarsElectricModern.pkg"
  name "MAContent10_AssetPack_0177_AlchemyGuitarsElectricModern"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0177_AlchemyGuitarsElectricModern.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0177_AlchemyGuitarsElectricModern.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0177_AlchemyGuitarsElectricModern"
end
