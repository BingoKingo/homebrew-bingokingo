cask "macontent10-assetpack-1006-alchemysamplesmodularmelodies" do
  version "4b7ad12fd4901cccd90ec76b284b1765"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1006_AlchemySamplesModularMelodies.pkg"
  name "MAContent10_AssetPack_1006_AlchemySamplesModularMelodies"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1006_AlchemySamplesModularMelodies.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1006_AlchemySamplesModularMelodies.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1006_AlchemySamplesModularMelodies"
end
