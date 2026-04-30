cask "macontent10-assetpack-0679-exs-electronicdrumkitshacienda" do
  version "3d239515887524fe50e87f4ae2fc94a5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0679_EXS_ElectronicDrumkitsHacienda.pkg"
  name "MAContent10_AssetPack_0679_EXS_ElectronicDrumkitsHacienda"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0679_EXS_ElectronicDrumkitsHacienda.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0679_EXS_ElectronicDrumkitsHacienda.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0679_EXS_ElectronicDrumkitsHacienda"
end
