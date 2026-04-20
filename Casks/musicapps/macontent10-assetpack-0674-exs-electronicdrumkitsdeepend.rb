cask "macontent10-assetpack-0674-exs-electronicdrumkitsdeepend" do
  version "eb4f8d5faabeb1ea0e9c8c8fcb9fb1af"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0674_EXS_ElectronicDrumkitsDeepEnd.pkg"
  name "MAContent10_AssetPack_0674_EXS_ElectronicDrumkitsDeepEnd"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0674_EXS_ElectronicDrumkitsDeepEnd.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0674_EXS_ElectronicDrumkitsDeepEnd.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0674_EXS_ElectronicDrumkitsDeepEnd"
end
