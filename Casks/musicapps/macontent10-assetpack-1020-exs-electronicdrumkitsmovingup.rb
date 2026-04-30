cask "macontent10-assetpack-1020-exs-electronicdrumkitsmovingup" do
  version "de01f6723195de299ff5ada4dbe35003"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1020_EXS_ElectronicDrumkitsMovingUp.pkg"
  name "MAContent10_AssetPack_1020_EXS_ElectronicDrumkitsMovingUp"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1020_EXS_ElectronicDrumkitsMovingUp.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1020_EXS_ElectronicDrumkitsMovingUp.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1020_EXS_ElectronicDrumkitsMovingUp"
end
