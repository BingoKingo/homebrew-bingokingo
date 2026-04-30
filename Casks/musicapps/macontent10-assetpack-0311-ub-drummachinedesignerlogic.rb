cask "macontent10-assetpack-0311-ub-drummachinedesignerlogic" do
  version "2f275a74191fed2c1c22a83a5c6d2c6e-7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0311_UB_DrumMachineDesignerLogic.pkg"
  name "MAContent10_AssetPack_0311_UB_DrumMachineDesignerLogic"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0311_UB_DrumMachineDesignerLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0311_UB_DrumMachineDesignerLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0311_UB_DrumMachineDesignerLogic"
end
