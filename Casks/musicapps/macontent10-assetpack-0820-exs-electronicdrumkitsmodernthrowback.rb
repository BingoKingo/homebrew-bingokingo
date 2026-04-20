cask "macontent10-assetpack-0820-exs-electronicdrumkitsmodernthrowback" do
  version "339ebb9ab3d4efb9c7dd64c825d046de"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0820_EXS_ElectronicDrumkitsModernThrowback.pkg"
  name "MAContent10_AssetPack_0820_EXS_ElectronicDrumkitsModernThrowback"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0820_EXS_ElectronicDrumkitsModernThrowback.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0820_EXS_ElectronicDrumkitsModernThrowback.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0820_EXS_ElectronicDrumkitsModernThrowback"
end
