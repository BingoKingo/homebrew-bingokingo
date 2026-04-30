cask "macontent10-assetpack-0168-alchemyguitarselectriccleanchorus" do
  version "5568c0780b76792378c52e97b88f26a7-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0168_AlchemyGuitarsElectricCleanChorus.pkg"
  name "MAContent10_AssetPack_0168_AlchemyGuitarsElectricCleanChorus"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0168_AlchemyGuitarsElectricCleanChorus.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0168_AlchemyGuitarsElectricCleanChorus.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0168_AlchemyGuitarsElectricCleanChorus"
end
