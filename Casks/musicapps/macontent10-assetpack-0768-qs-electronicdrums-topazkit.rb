cask "macontent10-assetpack-0768-qs-electronicdrums-topazkit" do
  version "c25394bf0a8e753829853642873a600d"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0768_QS_ElectronicDrums_TopazKit.pkg"
  name "MAContent10_AssetPack_0768_QS_ElectronicDrums_TopazKit"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0768_QS_ElectronicDrums_TopazKit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0768_QS_ElectronicDrums_TopazKit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0768_QS_ElectronicDrums_TopazKit"
end
