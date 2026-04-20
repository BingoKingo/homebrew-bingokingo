cask "macontent10-assetpack-0960-exs-electronicdrumkitshardwellcosmicdebris" do
  version "7fe581d60f24e59eb35f66e89709b44c"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0960_EXS_ElectronicDrumkitsHardwellCosmicDebris.pkg"
  name "MAContent10_AssetPack_0960_EXS_ElectronicDrumkitsHardwellCosmicDebris"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0960_EXS_ElectronicDrumkitsHardwellCosmicDebris.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0960_EXS_ElectronicDrumkitsHardwellCosmicDebris.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0960_EXS_ElectronicDrumkitsHardwellCosmicDebris"
end
