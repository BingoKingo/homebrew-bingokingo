cask "macontent10-assetpack-0846-exs-electronicdrumkitsoakfelderacousticbump" do
  version "e7ccc7e451b5ddf753ee885087061a81"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0846_EXS_ElectronicDrumkitsOakFelderAcousticBump.pkg"
  name "MAContent10_AssetPack_0846_EXS_ElectronicDrumkitsOakFelderAcousticBump"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0846_EXS_ElectronicDrumkitsOakFelderAcousticBump.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0846_EXS_ElectronicDrumkitsOakFelderAcousticBump.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0846_EXS_ElectronicDrumkitsOakFelderAcousticBump"
end
