cask "macontent10-assetpack-0928-exs-electronicdrumkitsvintagearcade" do
  version "02b5f8b4bbe78c161e47d2fb0421c1ce"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0928_EXS_ElectronicDrumkitsVintageArcade.pkg"
  name "MAContent10_AssetPack_0928_EXS_ElectronicDrumkitsVintageArcade"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0928_EXS_ElectronicDrumkitsVintageArcade.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0928_EXS_ElectronicDrumkitsVintageArcade.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0928_EXS_ElectronicDrumkitsVintageArcade"
end
