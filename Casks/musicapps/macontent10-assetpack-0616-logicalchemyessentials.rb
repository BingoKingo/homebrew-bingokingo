cask "macontent10-assetpack-0616-logicalchemyessentials" do
  version "b71a3a8c639354e9f5892f56f98b7da3-35"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0616_LogicAlchemyEssentials.pkg"
  name "MAContent10_AssetPack_0616_LogicAlchemyEssentials"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0616_LogicAlchemyEssentials.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0616_LogicAlchemyEssentials.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0616_LogicAlchemyEssentials"
end
