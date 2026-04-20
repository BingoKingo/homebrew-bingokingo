cask "macontent10-assetpack-0855-exs-electronicdrumkitstakeadaytripbrooklynborough" do
  version "8d7cb3a5a92967c943c54f7fa6607f47"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0855_EXS_ElectronicDrumkitsTakeADaytripBrooklynBorough.pkg"
  name "MAContent10_AssetPack_0855_EXS_ElectronicDrumkitsTakeADaytripBrooklynBorough"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0855_EXS_ElectronicDrumkitsTakeADaytripBrooklynBorough.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0855_EXS_ElectronicDrumkitsTakeADaytripBrooklynBorough.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0855_EXS_ElectronicDrumkitsTakeADaytripBrooklynBorough"
end
