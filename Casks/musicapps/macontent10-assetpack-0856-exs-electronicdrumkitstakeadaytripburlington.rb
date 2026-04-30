cask "macontent10-assetpack-0856-exs-electronicdrumkitstakeadaytripburlington" do
  version "9c502e12e910173a2c19ffd628c17a53"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0856_EXS_ElectronicDrumkitsTakeADaytripBurlington.pkg"
  name "MAContent10_AssetPack_0856_EXS_ElectronicDrumkitsTakeADaytripBurlington"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0856_EXS_ElectronicDrumkitsTakeADaytripBurlington.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0856_EXS_ElectronicDrumkitsTakeADaytripBurlington.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0856_EXS_ElectronicDrumkitsTakeADaytripBurlington"
end
