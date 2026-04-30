cask "macontent10-assetpack-0848-exs-electronicdrumkitsoakfeldermixedup" do
  version "124723d28104e6e227f3046ebf916b9c"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0848_EXS_ElectronicDrumkitsOakFelderMixedUp.pkg"
  name "MAContent10_AssetPack_0848_EXS_ElectronicDrumkitsOakFelderMixedUp"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0848_EXS_ElectronicDrumkitsOakFelderMixedUp.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0848_EXS_ElectronicDrumkitsOakFelderMixedUp.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0848_EXS_ElectronicDrumkitsOakFelderMixedUp"
end
