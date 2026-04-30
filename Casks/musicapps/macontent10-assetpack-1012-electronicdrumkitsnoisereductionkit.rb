cask "macontent10-assetpack-1012-electronicdrumkitsnoisereductionkit" do
  version "0ea59324fa32a1c16b73787addbf11c0"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1012_ElectronicDrumKitsNoiseReductionKit.pkg"
  name "MAContent10_AssetPack_1012_ElectronicDrumKitsNoiseReductionKit"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1012_ElectronicDrumKitsNoiseReductionKit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1012_ElectronicDrumKitsNoiseReductionKit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1012_ElectronicDrumKitsNoiseReductionKit"
end
