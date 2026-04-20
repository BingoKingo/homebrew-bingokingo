cask "macontent10-assetpack-0844-exs-electronicdrumkitsboysnoizecontrolvoltage" do
  version "37830f85182662f3ebee3ff74bd0313c"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0844_EXS_ElectronicDrumkitsBoysNoizeControlVoltage.pkg"
  name "MAContent10_AssetPack_0844_EXS_ElectronicDrumkitsBoysNoizeControlVoltage"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0844_EXS_ElectronicDrumkitsBoysNoizeControlVoltage.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0844_EXS_ElectronicDrumkitsBoysNoizeControlVoltage.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0844_EXS_ElectronicDrumkitsBoysNoizeControlVoltage"
end
