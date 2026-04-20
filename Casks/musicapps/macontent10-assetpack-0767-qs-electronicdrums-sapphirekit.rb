cask "macontent10-assetpack-0767-qs-electronicdrums-sapphirekit" do
  version "04cb66d4cc358ed5129a63de769b84b5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0767_QS_ElectronicDrums_SapphireKit.pkg"
  name "MAContent10_AssetPack_0767_QS_ElectronicDrums_SapphireKit"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0767_QS_ElectronicDrums_SapphireKit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0767_QS_ElectronicDrums_SapphireKit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0767_QS_ElectronicDrums_SapphireKit"
end
