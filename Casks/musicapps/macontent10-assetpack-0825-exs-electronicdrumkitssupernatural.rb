cask "macontent10-assetpack-0825-exs-electronicdrumkitssupernatural" do
  version "b594e5097056ffd3ce93e1ac12cedc60"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0825_EXS_ElectronicDrumkitsSuperNatural.pkg"
  name "MAContent10_AssetPack_0825_EXS_ElectronicDrumkitsSuperNatural"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0825_EXS_ElectronicDrumkitsSuperNatural.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0825_EXS_ElectronicDrumkitsSuperNatural.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0825_EXS_ElectronicDrumkitsSuperNatural"
end
