cask "macontent10-assetpack-0851-exs-electronicdrumkitssoulectionbigbump" do
  version "38b4aabce3539a86f062cde03c16c3b8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0851_EXS_ElectronicDrumkitsSoulectionBigBump.pkg"
  name "MAContent10_AssetPack_0851_EXS_ElectronicDrumkitsSoulectionBigBump"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0851_EXS_ElectronicDrumkitsSoulectionBigBump.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0851_EXS_ElectronicDrumkitsSoulectionBigBump.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0851_EXS_ElectronicDrumkitsSoulectionBigBump"
end
