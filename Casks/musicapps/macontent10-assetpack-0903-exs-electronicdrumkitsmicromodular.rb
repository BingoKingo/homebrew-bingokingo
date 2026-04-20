cask "macontent10-assetpack-0903-exs-electronicdrumkitsmicromodular" do
  version "6470ef6e5f6c6c29bb1b8b933e3dbe89"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0903_EXS_ElectronicDrumkitsMicroModular.pkg"
  name "MAContent10_AssetPack_0903_EXS_ElectronicDrumkitsMicroModular"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0903_EXS_ElectronicDrumkitsMicroModular.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0903_EXS_ElectronicDrumkitsMicroModular.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0903_EXS_ElectronicDrumkitsMicroModular"
end
