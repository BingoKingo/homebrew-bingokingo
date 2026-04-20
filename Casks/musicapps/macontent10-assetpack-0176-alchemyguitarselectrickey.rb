cask "macontent10-assetpack-0176-alchemyguitarselectrickey" do
  version "3ea749736287d01e2d511fb2ad90ff01-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0176_AlchemyGuitarsElectricKey.pkg"
  name "MAContent10_AssetPack_0176_AlchemyGuitarsElectricKey"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0176_AlchemyGuitarsElectricKey.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0176_AlchemyGuitarsElectricKey.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0176_AlchemyGuitarsElectricKey"
end
