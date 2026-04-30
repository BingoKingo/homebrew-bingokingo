cask "macontent10-assetpack-0771-alchemysamplesobliquestructures" do
  version "8bc0137d3b82e515aaec0cbb786ec78a-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0771_AlchemySamplesObliqueStructures.pkg"
  name "MAContent10_AssetPack_0771_AlchemySamplesObliqueStructures"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0771_AlchemySamplesObliqueStructures.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0771_AlchemySamplesObliqueStructures.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0771_AlchemySamplesObliqueStructures"
end
