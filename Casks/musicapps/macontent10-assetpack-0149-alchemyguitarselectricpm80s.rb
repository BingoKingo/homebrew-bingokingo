cask "macontent10-assetpack-0149-alchemyguitarselectricpm80s" do
  version "c88fb8dbfdc0b7126eac88d1782fcba2-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0149_AlchemyGuitarsElectricPM80s.pkg"
  name "MAContent10_AssetPack_0149_AlchemyGuitarsElectricPM80s"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0149_AlchemyGuitarsElectricPM80s.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0149_AlchemyGuitarsElectricPM80s.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0149_AlchemyGuitarsElectricPM80s"
end
