cask "macontent10-assetpack-0906-exs-electronicdrumkitsmodularspace" do
  version "04d7c8bfc8eeab2edb16799c257e6024"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0906_EXS_ElectronicDrumkitsModularSpace.pkg"
  name "MAContent10_AssetPack_0906_EXS_ElectronicDrumkitsModularSpace"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0906_EXS_ElectronicDrumkitsModularSpace.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0906_EXS_ElectronicDrumkitsModularSpace.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0906_EXS_ElectronicDrumkitsModularSpace"
end
