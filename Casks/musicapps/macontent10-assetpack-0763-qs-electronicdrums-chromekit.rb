cask "macontent10-assetpack-0763-qs-electronicdrums-chromekit" do
  version "b21688886ef1fef896f6b59002e735c3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0763_QS_ElectronicDrums_ChromeKit.pkg"
  name "MAContent10_AssetPack_0763_QS_ElectronicDrums_ChromeKit"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0763_QS_ElectronicDrums_ChromeKit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0763_QS_ElectronicDrums_ChromeKit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0763_QS_ElectronicDrums_ChromeKit"
end
