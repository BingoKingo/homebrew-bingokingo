cask "macontent10-assetpack-0615-gblogicalchemyessentials" do
  version "13963cdf54422be789fd4a5d6c87ed48-26"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0615_GBLogicAlchemyEssentials.pkg"
  name "MAContent10_AssetPack_0615_GBLogicAlchemyEssentials"
  desc "ContainsAlchemyFiles, IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0615_GBLogicAlchemyEssentials.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0615_GBLogicAlchemyEssentials.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0615_GBLogicAlchemyEssentials"
end
