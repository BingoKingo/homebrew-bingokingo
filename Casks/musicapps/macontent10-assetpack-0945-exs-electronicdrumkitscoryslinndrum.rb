cask "macontent10-assetpack-0945-exs-electronicdrumkitscoryslinndrum" do
  version "c6da8bc07441e4646dfe01fdf0bffdb3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0945_EXS_ElectronicDrumkitsCorysLinnDrum.pkg"
  name "MAContent10_AssetPack_0945_EXS_ElectronicDrumkitsCorysLinnDrum"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0945_EXS_ElectronicDrumkitsCorysLinnDrum.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0945_EXS_ElectronicDrumkitsCorysLinnDrum.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0945_EXS_ElectronicDrumkitsCorysLinnDrum"
end
