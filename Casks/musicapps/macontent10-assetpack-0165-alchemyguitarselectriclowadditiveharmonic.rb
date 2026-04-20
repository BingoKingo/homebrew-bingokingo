cask "macontent10-assetpack-0165-alchemyguitarselectriclowadditiveharmonic" do
  version "003413edeba4446a92c62ee2f6eab48b-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0165_AlchemyGuitarsElectricLowAdditiveHarmonic.pkg"
  name "MAContent10_AssetPack_0165_AlchemyGuitarsElectricLowAdditiveHarmonic"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0165_AlchemyGuitarsElectricLowAdditiveHarmonic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0165_AlchemyGuitarsElectricLowAdditiveHarmonic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0165_AlchemyGuitarsElectricLowAdditiveHarmonic"
end
