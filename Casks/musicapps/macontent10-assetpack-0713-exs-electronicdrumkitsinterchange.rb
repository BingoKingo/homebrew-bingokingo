cask "macontent10-assetpack-0713-exs-electronicdrumkitsinterchange" do
  version "e6d862bb2f8a493f87b46485ec248e13"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0713_EXS_ElectronicDrumkitsInterchange.pkg"
  name "MAContent10_AssetPack_0713_EXS_ElectronicDrumkitsInterchange"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0713_EXS_ElectronicDrumkitsInterchange.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0713_EXS_ElectronicDrumkitsInterchange.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0713_EXS_ElectronicDrumkitsInterchange"
end
