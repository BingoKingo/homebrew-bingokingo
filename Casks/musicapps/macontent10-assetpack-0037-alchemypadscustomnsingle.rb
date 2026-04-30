cask "macontent10-assetpack-0037-alchemypadscustomnsingle" do
  version "cb673ede64392a1d7bb63efa41abbb32-22"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0037_AlchemyPadsCustomNSingle.pkg"
  name "MAContent10_AssetPack_0037_AlchemyPadsCustomNSingle"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0037_AlchemyPadsCustomNSingle.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0037_AlchemyPadsCustomNSingle.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0037_AlchemyPadsCustomNSingle"
end
