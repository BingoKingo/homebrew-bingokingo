cask "macontent10-assetpack-0849-exs-electronicdrumkitsoakfeldertwotonpop" do
  version "9141145ed67a9106288484ad64081a12"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0849_EXS_ElectronicDrumkitsOakFelderTwoTonPop.pkg"
  name "MAContent10_AssetPack_0849_EXS_ElectronicDrumkitsOakFelderTwoTonPop"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0849_EXS_ElectronicDrumkitsOakFelderTwoTonPop.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0849_EXS_ElectronicDrumkitsOakFelderTwoTonPop.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0849_EXS_ElectronicDrumkitsOakFelderTwoTonPop"
end
