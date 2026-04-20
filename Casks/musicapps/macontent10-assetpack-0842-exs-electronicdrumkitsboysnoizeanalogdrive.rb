cask "macontent10-assetpack-0842-exs-electronicdrumkitsboysnoizeanalogdrive" do
  version "1cee846c6707941a0d4c727e28b77eab"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0842_EXS_ElectronicDrumkitsBoysNoizeAnalogDrive.pkg"
  name "MAContent10_AssetPack_0842_EXS_ElectronicDrumkitsBoysNoizeAnalogDrive"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0842_EXS_ElectronicDrumkitsBoysNoizeAnalogDrive.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0842_EXS_ElectronicDrumkitsBoysNoizeAnalogDrive.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0842_EXS_ElectronicDrumkitsBoysNoizeAnalogDrive"
end
