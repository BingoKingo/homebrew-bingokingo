cask "macontent10-assetpack-0845-exs-electronicdrumkitsboysnoizenaturalstructures" do
  version "a388756c92c6fe5fb379c4d0c23ee437"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0845_EXS_ElectronicDrumkitsBoysNoizeNaturalStructures.pkg"
  name "MAContent10_AssetPack_0845_EXS_ElectronicDrumkitsBoysNoizeNaturalStructures"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0845_EXS_ElectronicDrumkitsBoysNoizeNaturalStructures.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0845_EXS_ElectronicDrumkitsBoysNoizeNaturalStructures.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0845_EXS_ElectronicDrumkitsBoysNoizeNaturalStructures"
end
