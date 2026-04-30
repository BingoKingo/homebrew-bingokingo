cask "macontent10-assetpack-0155-alchemyguitarselectrichighgranularharmonic" do
  version "5becd5cb3490270e5b8429944d203d87-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0155_AlchemyGuitarsElectricHighGranularHarmonic.pkg"
  name "MAContent10_AssetPack_0155_AlchemyGuitarsElectricHighGranularHarmonic"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0155_AlchemyGuitarsElectricHighGranularHarmonic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0155_AlchemyGuitarsElectricHighGranularHarmonic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0155_AlchemyGuitarsElectricHighGranularHarmonic"
end
