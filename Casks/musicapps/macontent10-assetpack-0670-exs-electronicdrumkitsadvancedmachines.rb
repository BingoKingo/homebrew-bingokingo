cask "macontent10-assetpack-0670-exs-electronicdrumkitsadvancedmachines" do
  version "6880ee5923dcd5f99644f0138bd8f043"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0670_EXS_ElectronicDrumkitsAdvancedMachines.pkg"
  name "MAContent10_AssetPack_0670_EXS_ElectronicDrumkitsAdvancedMachines"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0670_EXS_ElectronicDrumkitsAdvancedMachines.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0670_EXS_ElectronicDrumkitsAdvancedMachines.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0670_EXS_ElectronicDrumkitsAdvancedMachines"
end
