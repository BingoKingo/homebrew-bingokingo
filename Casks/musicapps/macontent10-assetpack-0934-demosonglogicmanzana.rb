cask "macontent10-assetpack-0934-demosonglogicmanzana" do
  version "e2e8c4a8011ce68f18191a1d843d3498-31"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0934_DemosongLogicManzana.pkg"
  name "MAContent10_AssetPack_0934_DemosongLogicManzana"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0934_DemosongLogicManzana.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0934_DemosongLogicManzana.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0934_DemosongLogicManzana"
end
