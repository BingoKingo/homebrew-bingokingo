cask "macontent10-assetpack-0599-gblogicalchemyessentials" do
  version "28fabc7799b4a8cd409e4d5b5b803e58-27"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0599_GBLogicAlchemyEssentials.pkg"
  name "MAContent10_AssetPack_0599_GBLogicAlchemyEssentials"
  desc "ContainsAlchemyFiles, IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0599_GBLogicAlchemyEssentials.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0599_GBLogicAlchemyEssentials.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0599_GBLogicAlchemyEssentials"
end
