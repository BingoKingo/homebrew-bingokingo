cask "macontent10-assetpack-0169-alchemyguitarselectricbigbuzz" do
  version "21e264de5b0f65a6c528bd83abca0026-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0169_AlchemyGuitarsElectricBigBuzz.pkg"
  name "MAContent10_AssetPack_0169_AlchemyGuitarsElectricBigBuzz"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0169_AlchemyGuitarsElectricBigBuzz.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0169_AlchemyGuitarsElectricBigBuzz.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0169_AlchemyGuitarsElectricBigBuzz"
end
