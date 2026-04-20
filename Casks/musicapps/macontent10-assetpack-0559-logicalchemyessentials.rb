cask "macontent10-assetpack-0559-logicalchemyessentials" do
  version "9629e46efabb4316de07d78597fa881d-36"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0559_LogicAlchemyEssentials.pkg"
  name "MAContent10_AssetPack_0559_LogicAlchemyEssentials"
  desc "ContainsAlchemyFiles, IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0559_LogicAlchemyEssentials.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0559_LogicAlchemyEssentials.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0559_LogicAlchemyEssentials"
end
