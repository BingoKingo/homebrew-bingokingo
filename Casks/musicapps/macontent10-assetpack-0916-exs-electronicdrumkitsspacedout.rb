cask "macontent10-assetpack-0916-exs-electronicdrumkitsspacedout" do
  version "0fcd761daf262ec91fa6801593ff478c"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0916_EXS_ElectronicDrumkitsSpacedOut.pkg"
  name "MAContent10_AssetPack_0916_EXS_ElectronicDrumkitsSpacedOut"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0916_EXS_ElectronicDrumkitsSpacedOut.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0916_EXS_ElectronicDrumkitsSpacedOut.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0916_EXS_ElectronicDrumkitsSpacedOut"
end
