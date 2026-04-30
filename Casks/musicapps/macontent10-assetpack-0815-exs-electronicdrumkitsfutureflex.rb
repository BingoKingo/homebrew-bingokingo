cask "macontent10-assetpack-0815-exs-electronicdrumkitsfutureflex" do
  version "b0f25169e8d99f6744e8915b7c503c36"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0815_EXS_ElectronicDrumkitsFutureFlex.pkg"
  name "MAContent10_AssetPack_0815_EXS_ElectronicDrumkitsFutureFlex"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0815_EXS_ElectronicDrumkitsFutureFlex.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0815_EXS_ElectronicDrumkitsFutureFlex.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0815_EXS_ElectronicDrumkitsFutureFlex"
end
