cask "macontent10-assetpack-0154-alchemyguitarselectricdistorto" do
  version "cc2ec1be1af16fcf3c0955088244f542-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0154_AlchemyGuitarsElectricDistorto.pkg"
  name "MAContent10_AssetPack_0154_AlchemyGuitarsElectricDistorto"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0154_AlchemyGuitarsElectricDistorto.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0154_AlchemyGuitarsElectricDistorto.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0154_AlchemyGuitarsElectricDistorto"
end
