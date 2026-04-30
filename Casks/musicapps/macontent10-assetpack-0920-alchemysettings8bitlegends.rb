cask "macontent10-assetpack-0920-alchemysettings8bitlegends" do
  version "c544f76b45f3f89dca280ee6586e1779"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0920_AlchemySettings8BitLegends.pkg"
  name "MAContent10_AssetPack_0920_AlchemySettings8BitLegends"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0920_AlchemySettings8BitLegends.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0920_AlchemySettings8BitLegends.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0920_AlchemySettings8BitLegends"
end
