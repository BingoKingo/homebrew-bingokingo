cask "macontent10-assetpack-0161-alchemyguitarselectricpadscratching" do
  version "aa0e465cfc98f3b50a563913d789158e-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0161_AlchemyGuitarsElectricPadScratching.pkg"
  name "MAContent10_AssetPack_0161_AlchemyGuitarsElectricPadScratching"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0161_AlchemyGuitarsElectricPadScratching.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0161_AlchemyGuitarsElectricPadScratching.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0161_AlchemyGuitarsElectricPadScratching"
end
