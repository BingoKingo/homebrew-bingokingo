cask "macontent10-assetpack-0758-exs-electronicdrumkitshardbounce" do
  version "6c23ea94df8c6f7e86d2fa8c7f135923"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0758_EXS_ElectronicDrumkitsHardBounce.pkg"
  name "MAContent10_AssetPack_0758_EXS_ElectronicDrumkitsHardBounce"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0758_EXS_ElectronicDrumkitsHardBounce.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0758_EXS_ElectronicDrumkitsHardBounce.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0758_EXS_ElectronicDrumkitsHardBounce"
end
