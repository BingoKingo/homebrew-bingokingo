cask "macontent10-assetpack-0854-exs-electronicdrumkitstakeadaytripalphabetcity" do
  version "34a3f22a18c7dc7252b05963e018f857"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0854_EXS_ElectronicDrumkitsTakeADaytripAlphabetCity.pkg"
  name "MAContent10_AssetPack_0854_EXS_ElectronicDrumkitsTakeADaytripAlphabetCity"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0854_EXS_ElectronicDrumkitsTakeADaytripAlphabetCity.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0854_EXS_ElectronicDrumkitsTakeADaytripAlphabetCity.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0854_EXS_ElectronicDrumkitsTakeADaytripAlphabetCity"
end
