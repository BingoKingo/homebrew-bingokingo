cask "macontent10-assetpack-0736-exs-electronicdrumkitsvintagedrumtraks" do
  version "e3ab82da78845c569b67bb9b02e949a6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0736_EXS_ElectronicDrumkitsVintageDrumTraks.pkg"
  name "MAContent10_AssetPack_0736_EXS_ElectronicDrumkitsVintageDrumTraks"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0736_EXS_ElectronicDrumkitsVintageDrumTraks.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0736_EXS_ElectronicDrumkitsVintageDrumTraks.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0736_EXS_ElectronicDrumkitsVintageDrumTraks"
end
