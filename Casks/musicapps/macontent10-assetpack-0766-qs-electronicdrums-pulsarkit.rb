cask "macontent10-assetpack-0766-qs-electronicdrums-pulsarkit" do
  version "9e725607b1e2c01aa30bff01414692e8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0766_QS_ElectronicDrums_PulsarKit.pkg"
  name "MAContent10_AssetPack_0766_QS_ElectronicDrums_PulsarKit"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0766_QS_ElectronicDrums_PulsarKit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0766_QS_ElectronicDrums_PulsarKit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0766_QS_ElectronicDrums_PulsarKit"
end
