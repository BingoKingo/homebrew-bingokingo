cask "macontent10-assetpack-0708-alchemyorganscustom" do
  version "89e81fb858e07d640a4cae1aaec5a3f5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0708_AlchemyOrgansCustom.pkg"
  name "MAContent10_AssetPack_0708_AlchemyOrgansCustom"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0708_AlchemyOrgansCustom.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0708_AlchemyOrgansCustom.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0708_AlchemyOrgansCustom"
end
