cask "macontent10-assetpack-0899-exs-electronicdrumkitsanalogbliss" do
  version "e811b784f81c5fd02f29799068e31045"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0899_EXS_ElectronicDrumkitsAnalogBliss.pkg"
  name "MAContent10_AssetPack_0899_EXS_ElectronicDrumkitsAnalogBliss"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0899_EXS_ElectronicDrumkitsAnalogBliss.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0899_EXS_ElectronicDrumkitsAnalogBliss.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0899_EXS_ElectronicDrumkitsAnalogBliss"
end
