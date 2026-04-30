cask "macontent10-assetpack-0990-electronicdrummerhyperdrop" do
  version "07d0ff7b5189db012f4784569f2a63ee"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0990_ElectronicDrummerHyperDrop.pkg"
  name "MAContent10_AssetPack_0990_ElectronicDrummerHyperDrop"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0990_ElectronicDrummerHyperDrop.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0990_ElectronicDrummerHyperDrop.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0990_ElectronicDrummerHyperDrop"
end
