cask "macontent10-assetpack-0153-alchemyguitarselectricplectr" do
  version "4034d259478a4bec8c677febf2304eba-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0153_AlchemyGuitarsElectricPlectR.pkg"
  name "MAContent10_AssetPack_0153_AlchemyGuitarsElectricPlectR"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0153_AlchemyGuitarsElectricPlectR.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0153_AlchemyGuitarsElectricPlectR.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0153_AlchemyGuitarsElectricPlectR"
end
