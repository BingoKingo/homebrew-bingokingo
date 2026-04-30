cask "macontent10-assetpack-0164-alchemyguitarselectrichighadditiveharmonic" do
  version "ec727cccd8e2e6989e836fae397f7521-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0164_AlchemyGuitarsElectricHighAdditiveHarmonic.pkg"
  name "MAContent10_AssetPack_0164_AlchemyGuitarsElectricHighAdditiveHarmonic"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0164_AlchemyGuitarsElectricHighAdditiveHarmonic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0164_AlchemyGuitarsElectricHighAdditiveHarmonic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0164_AlchemyGuitarsElectricHighAdditiveHarmonic"
end
