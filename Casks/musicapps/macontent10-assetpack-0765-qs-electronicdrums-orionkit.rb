cask "macontent10-assetpack-0765-qs-electronicdrums-orionkit" do
  version "a09c39be55b1eb42c8b388c2e30dc1ad"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0765_QS_ElectronicDrums_OrionKit.pkg"
  name "MAContent10_AssetPack_0765_QS_ElectronicDrums_OrionKit"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0765_QS_ElectronicDrums_OrionKit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0765_QS_ElectronicDrums_OrionKit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0765_QS_ElectronicDrums_OrionKit"
end
