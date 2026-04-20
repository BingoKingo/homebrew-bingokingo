cask "macontent10-assetpack-1024-exs-electronicdrumkitsstardust" do
  version "c871d49b8f289ffc6cc5d52195209f5e"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1024_EXS_ElectronicDrumkitsStardust.pkg"
  name "MAContent10_AssetPack_1024_EXS_ElectronicDrumkitsStardust"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1024_EXS_ElectronicDrumkitsStardust.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1024_EXS_ElectronicDrumkitsStardust.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1024_EXS_ElectronicDrumkitsStardust"
end
