cask "macontent10-assetpack-0881-exs-electronicdrumkitstrakgirllofifeels" do
  version "9da3f8ccf352ce0fdcd0e7575c121c0e"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0881_EXS_ElectronicDrumkitsTrakgirlLofiFeels.pkg"
  name "MAContent10_AssetPack_0881_EXS_ElectronicDrumkitsTrakgirlLofiFeels"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0881_EXS_ElectronicDrumkitsTrakgirlLofiFeels.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0881_EXS_ElectronicDrumkitsTrakgirlLofiFeels.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0881_EXS_ElectronicDrumkitsTrakgirlLofiFeels"
end
