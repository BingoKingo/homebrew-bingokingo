cask "macontent10-assetpack-0166-alchemyguitarselectricformerbellguita" do
  version "a61cd93446ae6e4f8b26f535e4989024-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0166_AlchemyGuitarsElectricFormerBellGuita.pkg"
  name "MAContent10_AssetPack_0166_AlchemyGuitarsElectricFormerBellGuita"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0166_AlchemyGuitarsElectricFormerBellGuita.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0166_AlchemyGuitarsElectricFormerBellGuita.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0166_AlchemyGuitarsElectricFormerBellGuita"
end
