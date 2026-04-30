cask "macontent10-assetpack-0867-exs-electronicdrumkitswatchthesoundpawnshop808" do
  version "0976b0e16e9867430a948cd5b7bc9fd7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0867_EXS_ElectronicDrumkitsWatchTheSoundPawnShop808.pkg"
  name "MAContent10_AssetPack_0867_EXS_ElectronicDrumkitsWatchTheSoundPawnShop808"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0867_EXS_ElectronicDrumkitsWatchTheSoundPawnShop808.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0867_EXS_ElectronicDrumkitsWatchTheSoundPawnShop808.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0867_EXS_ElectronicDrumkitsWatchTheSoundPawnShop808"
end
