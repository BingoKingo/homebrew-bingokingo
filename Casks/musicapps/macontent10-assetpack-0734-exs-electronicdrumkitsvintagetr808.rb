cask "macontent10-assetpack-0734-exs-electronicdrumkitsvintagetr808" do
  version "b9edb7c82a6fa2111ad306f43d22f2fc"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0734_EXS_ElectronicDrumkitsVintageTR808.pkg"
  name "MAContent10_AssetPack_0734_EXS_ElectronicDrumkitsVintageTR808"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0734_EXS_ElectronicDrumkitsVintageTR808.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0734_EXS_ElectronicDrumkitsVintageTR808.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0734_EXS_ElectronicDrumkitsVintageTR808"
end
