cask "macontent10-assetpack-0907-exs-electronicdrumkitsplonkymodular" do
  version "923d5c53d48de038d9469ccb52db23f7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0907_EXS_ElectronicDrumkitsPlonkyModular.pkg"
  name "MAContent10_AssetPack_0907_EXS_ElectronicDrumkitsPlonkyModular"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0907_EXS_ElectronicDrumkitsPlonkyModular.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0907_EXS_ElectronicDrumkitsPlonkyModular.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0907_EXS_ElectronicDrumkitsPlonkyModular"
end
