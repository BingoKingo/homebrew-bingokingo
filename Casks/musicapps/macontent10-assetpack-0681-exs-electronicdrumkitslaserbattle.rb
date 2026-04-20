cask "macontent10-assetpack-0681-exs-electronicdrumkitslaserbattle" do
  version "03ee8b01193193e672fa5bb6e044365d"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0681_EXS_ElectronicDrumkitsLaserBattle.pkg"
  name "MAContent10_AssetPack_0681_EXS_ElectronicDrumkitsLaserBattle"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0681_EXS_ElectronicDrumkitsLaserBattle.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0681_EXS_ElectronicDrumkitsLaserBattle.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0681_EXS_ElectronicDrumkitsLaserBattle"
end
