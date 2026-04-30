cask "macontent10-assetpack-0764-qs-electronicdrums-deepbluekit" do
  version "6043594e6aa994e368aef600bbabb6f7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0764_QS_ElectronicDrums_DeepBlueKit.pkg"
  name "MAContent10_AssetPack_0764_QS_ElectronicDrums_DeepBlueKit"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0764_QS_ElectronicDrums_DeepBlueKit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0764_QS_ElectronicDrums_DeepBlueKit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0764_QS_ElectronicDrums_DeepBlueKit"
end
