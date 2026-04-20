cask "macontent10-assetpack-1021-exs-electronicdrumkitsneonglow" do
  version "7189849aa951b15baf1f98b9d378ea4c"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1021_EXS_ElectronicDrumkitsNeonGlow.pkg"
  name "MAContent10_AssetPack_1021_EXS_ElectronicDrumkitsNeonGlow"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1021_EXS_ElectronicDrumkitsNeonGlow.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1021_EXS_ElectronicDrumkitsNeonGlow.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1021_EXS_ElectronicDrumkitsNeonGlow"
end
