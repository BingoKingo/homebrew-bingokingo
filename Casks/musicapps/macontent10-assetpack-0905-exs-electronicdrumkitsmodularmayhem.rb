cask "macontent10-assetpack-0905-exs-electronicdrumkitsmodularmayhem" do
  version "a1af541ee84e3934e65382ac39e9d506"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0905_EXS_ElectronicDrumkitsModularMayhem.pkg"
  name "MAContent10_AssetPack_0905_EXS_ElectronicDrumkitsModularMayhem"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0905_EXS_ElectronicDrumkitsModularMayhem.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0905_EXS_ElectronicDrumkitsModularMayhem.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0905_EXS_ElectronicDrumkitsModularMayhem"
end
