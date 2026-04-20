cask "macontent10-assetpack-0901-exs-electronicdrumkitsanaloghaze" do
  version "c999094b2862ed31f5fbac177530be4a"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0901_EXS_ElectronicDrumkitsAnalogHaze.pkg"
  name "MAContent10_AssetPack_0901_EXS_ElectronicDrumkitsAnalogHaze"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0901_EXS_ElectronicDrumkitsAnalogHaze.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0901_EXS_ElectronicDrumkitsAnalogHaze.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0901_EXS_ElectronicDrumkitsAnalogHaze"
end
