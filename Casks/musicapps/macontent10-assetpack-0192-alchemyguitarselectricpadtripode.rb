cask "macontent10-assetpack-0192-alchemyguitarselectricpadtripode" do
  version "f3149839a33594312e9ada2806be35db-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0192_AlchemyGuitarsElectricPadTripode.pkg"
  name "MAContent10_AssetPack_0192_AlchemyGuitarsElectricPadTripode"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0192_AlchemyGuitarsElectricPadTripode.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0192_AlchemyGuitarsElectricPadTripode.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0192_AlchemyGuitarsElectricPadTripode"
end
