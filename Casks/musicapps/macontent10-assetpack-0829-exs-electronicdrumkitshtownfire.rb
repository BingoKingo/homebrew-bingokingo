cask "macontent10-assetpack-0829-exs-electronicdrumkitshtownfire" do
  version "2acc61744f17bb61f16102c8bf8a139d"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0829_EXS_ElectronicDrumkitsHTownFire.pkg"
  name "MAContent10_AssetPack_0829_EXS_ElectronicDrumkitsHTownFire"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0829_EXS_ElectronicDrumkitsHTownFire.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0829_EXS_ElectronicDrumkitsHTownFire.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0829_EXS_ElectronicDrumkitsHTownFire"
end
