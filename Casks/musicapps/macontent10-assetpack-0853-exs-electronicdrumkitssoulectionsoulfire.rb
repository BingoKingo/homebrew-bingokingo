cask "macontent10-assetpack-0853-exs-electronicdrumkitssoulectionsoulfire" do
  version "71cf3c45d25ac8999f36118aff2d4379"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0853_EXS_ElectronicDrumkitsSoulectionSoulFire.pkg"
  name "MAContent10_AssetPack_0853_EXS_ElectronicDrumkitsSoulectionSoulFire"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0853_EXS_ElectronicDrumkitsSoulectionSoulFire.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0853_EXS_ElectronicDrumkitsSoulectionSoulFire.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0853_EXS_ElectronicDrumkitsSoulectionSoulFire"
end
