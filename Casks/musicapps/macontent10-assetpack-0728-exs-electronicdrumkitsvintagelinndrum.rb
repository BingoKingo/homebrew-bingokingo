cask "macontent10-assetpack-0728-exs-electronicdrumkitsvintagelinndrum" do
  version "583a0ad1bcb924c7e3c47efb402f436f"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0728_EXS_ElectronicDrumkitsVintageLinnDrum.pkg"
  name "MAContent10_AssetPack_0728_EXS_ElectronicDrumkitsVintageLinnDrum"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0728_EXS_ElectronicDrumkitsVintageLinnDrum.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0728_EXS_ElectronicDrumkitsVintageLinnDrum.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0728_EXS_ElectronicDrumkitsVintageLinnDrum"
end
