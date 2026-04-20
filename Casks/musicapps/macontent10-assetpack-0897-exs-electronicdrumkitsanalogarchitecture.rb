cask "macontent10-assetpack-0897-exs-electronicdrumkitsanalogarchitecture" do
  version "94ba8462e75320b0f9feb867f23c8c8f"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0897_EXS_ElectronicDrumkitsAnalogArchitecture.pkg"
  name "MAContent10_AssetPack_0897_EXS_ElectronicDrumkitsAnalogArchitecture"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0897_EXS_ElectronicDrumkitsAnalogArchitecture.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0897_EXS_ElectronicDrumkitsAnalogArchitecture.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0897_EXS_ElectronicDrumkitsAnalogArchitecture"
end
