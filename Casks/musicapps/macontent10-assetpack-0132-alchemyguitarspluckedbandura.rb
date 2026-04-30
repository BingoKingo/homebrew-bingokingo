cask "macontent10-assetpack-0132-alchemyguitarspluckedbandura" do
  version "d2887422b89b14d62d99a961e64b92e9-15"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0132_AlchemyGuitarsPluckedBandura.pkg"
  name "MAContent10_AssetPack_0132_AlchemyGuitarsPluckedBandura"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0132_AlchemyGuitarsPluckedBandura.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0132_AlchemyGuitarsPluckedBandura.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0132_AlchemyGuitarsPluckedBandura"
end
