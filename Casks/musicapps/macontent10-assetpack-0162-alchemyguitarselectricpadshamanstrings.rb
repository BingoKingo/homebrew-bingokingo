cask "macontent10-assetpack-0162-alchemyguitarselectricpadshamanstrings" do
  version "90bad9268c2bc4a2350257cbdcaa39fd-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0162_AlchemyGuitarsElectricPadShamanStrings.pkg"
  name "MAContent10_AssetPack_0162_AlchemyGuitarsElectricPadShamanStrings"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0162_AlchemyGuitarsElectricPadShamanStrings.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0162_AlchemyGuitarsElectricPadShamanStrings.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0162_AlchemyGuitarsElectricPadShamanStrings"
end
