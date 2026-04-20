cask "macontent10-assetpack-0170-alchemyguitarselectrictrad" do
  version "2e68ff4367ff709418ffe6724e999b36-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0170_AlchemyGuitarsElectricTrad.pkg"
  name "MAContent10_AssetPack_0170_AlchemyGuitarsElectricTrad"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0170_AlchemyGuitarsElectricTrad.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0170_AlchemyGuitarsElectricTrad.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0170_AlchemyGuitarsElectricTrad"
end
