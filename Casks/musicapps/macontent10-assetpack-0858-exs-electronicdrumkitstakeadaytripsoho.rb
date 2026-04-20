cask "macontent10-assetpack-0858-exs-electronicdrumkitstakeadaytripsoho" do
  version "e0f3b35d86b460b1890afa7a537b9d1c"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0858_EXS_ElectronicDrumkitsTakeADaytripSoHo.pkg"
  name "MAContent10_AssetPack_0858_EXS_ElectronicDrumkitsTakeADaytripSoHo"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0858_EXS_ElectronicDrumkitsTakeADaytripSoHo.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0858_EXS_ElectronicDrumkitsTakeADaytripSoHo.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0858_EXS_ElectronicDrumkitsTakeADaytripSoHo"
end
