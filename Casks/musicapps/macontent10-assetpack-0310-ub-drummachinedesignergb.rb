cask "macontent10-assetpack-0310-ub-drummachinedesignergb" do
  version "270c2594ba98b5b00eb1ecbf5ad4c93f-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0310_UB_DrumMachineDesignerGB.pkg"
  name "MAContent10_AssetPack_0310_UB_DrumMachineDesignerGB"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0310_UB_DrumMachineDesignerGB.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0310_UB_DrumMachineDesignerGB.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0310_UB_DrumMachineDesignerGB"
end
