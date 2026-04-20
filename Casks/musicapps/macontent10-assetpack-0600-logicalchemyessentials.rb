cask "macontent10-assetpack-0600-logicalchemyessentials" do
  version "88359644c92b195f9602350e6e961e9b-35"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0600_LogicAlchemyEssentials.pkg"
  name "MAContent10_AssetPack_0600_LogicAlchemyEssentials"
  desc "ContainsAlchemyFiles, IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0600_LogicAlchemyEssentials.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0600_LogicAlchemyEssentials.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0600_LogicAlchemyEssentials"
end
