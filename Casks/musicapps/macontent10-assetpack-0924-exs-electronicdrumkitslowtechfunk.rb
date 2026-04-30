cask "macontent10-assetpack-0924-exs-electronicdrumkitslowtechfunk" do
  version "99cffcf49721908cda01d75ca094ece9"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0924_EXS_ElectronicDrumkitsLowTechFunk.pkg"
  name "MAContent10_AssetPack_0924_EXS_ElectronicDrumkitsLowTechFunk"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0924_EXS_ElectronicDrumkitsLowTechFunk.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0924_EXS_ElectronicDrumkitsLowTechFunk.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0924_EXS_ElectronicDrumkitsLowTechFunk"
end
