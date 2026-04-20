cask "macontent10-assetpack-0908-exs-electronicdrumkitswestcoastmodular" do
  version "4cbfee2b785216acd1df07b3d5b02ffb"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0908_EXS_ElectronicDrumkitsWestCoastModular.pkg"
  name "MAContent10_AssetPack_0908_EXS_ElectronicDrumkitsWestCoastModular"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0908_EXS_ElectronicDrumkitsWestCoastModular.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0908_EXS_ElectronicDrumkitsWestCoastModular.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0908_EXS_ElectronicDrumkitsWestCoastModular"
end
