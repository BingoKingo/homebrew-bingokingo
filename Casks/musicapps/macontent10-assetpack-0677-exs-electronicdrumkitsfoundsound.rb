cask "macontent10-assetpack-0677-exs-electronicdrumkitsfoundsound" do
  version "385d7245d87c50fec021db207a7da4fc"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0677_EXS_ElectronicDrumkitsFoundSound.pkg"
  name "MAContent10_AssetPack_0677_EXS_ElectronicDrumkitsFoundSound"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0677_EXS_ElectronicDrumkitsFoundSound.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0677_EXS_ElectronicDrumkitsFoundSound.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0677_EXS_ElectronicDrumkitsFoundSound"
end
