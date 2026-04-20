cask "macontent10-assetpack-0180-alchemyguitarselectricstereosteel" do
  version "b1179856fede6bf71736889cf85cf53c-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0180_AlchemyGuitarsElectricStereoSteel.pkg"
  name "MAContent10_AssetPack_0180_AlchemyGuitarsElectricStereoSteel"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0180_AlchemyGuitarsElectricStereoSteel.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0180_AlchemyGuitarsElectricStereoSteel.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0180_AlchemyGuitarsElectricStereoSteel"
end
