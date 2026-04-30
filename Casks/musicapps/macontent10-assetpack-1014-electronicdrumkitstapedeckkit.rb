cask "macontent10-assetpack-1014-electronicdrumkitstapedeckkit" do
  version "32534621dd052593d9bb82752164d287"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1014_ElectronicDrumKitsTapeDeckKit.pkg"
  name "MAContent10_AssetPack_1014_ElectronicDrumKitsTapeDeckKit"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1014_ElectronicDrumKitsTapeDeckKit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1014_ElectronicDrumKitsTapeDeckKit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1014_ElectronicDrumKitsTapeDeckKit"
end
