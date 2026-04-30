cask "macontent10-assetpack-0730-exs-electronicdrumkitsvintagecr8000" do
  version "da2ec00e3af732a5af874557f1c37b5e"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0730_EXS_ElectronicDrumkitsVintageCR8000.pkg"
  name "MAContent10_AssetPack_0730_EXS_ElectronicDrumkitsVintageCR8000"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0730_EXS_ElectronicDrumkitsVintageCR8000.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0730_EXS_ElectronicDrumkitsVintageCR8000.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0730_EXS_ElectronicDrumkitsVintageCR8000"
end
