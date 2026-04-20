cask "macontent10-assetpack-0835-exs-electronicdrumkitswarmembers" do
  version "226f2da3533350c5c25a9b7e4ea233ac"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0835_EXS_ElectronicDrumkitsWarmEmbers.pkg"
  name "MAContent10_AssetPack_0835_EXS_ElectronicDrumkitsWarmEmbers"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0835_EXS_ElectronicDrumkitsWarmEmbers.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0835_EXS_ElectronicDrumkitsWarmEmbers.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0835_EXS_ElectronicDrumkitsWarmEmbers"
end
