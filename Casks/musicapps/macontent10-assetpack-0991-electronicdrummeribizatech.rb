cask "macontent10-assetpack-0991-electronicdrummeribizatech" do
  version "59269138fc9c2fc8aa3d84fbd1d477b9"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0991_ElectronicDrummerIbizaTech.pkg"
  name "MAContent10_AssetPack_0991_ElectronicDrummerIbizaTech"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0991_ElectronicDrummerIbizaTech.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0991_ElectronicDrummerIbizaTech.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0991_ElectronicDrummerIbizaTech"
end
