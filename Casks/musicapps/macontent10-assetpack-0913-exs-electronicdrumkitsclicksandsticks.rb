cask "macontent10-assetpack-0913-exs-electronicdrumkitsclicksandsticks" do
  version "04577e3b0be2ed63226a63508caa6762"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0913_EXS_ElectronicDrumkitsClicksAndSticks.pkg"
  name "MAContent10_AssetPack_0913_EXS_ElectronicDrumkitsClicksAndSticks"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0913_EXS_ElectronicDrumkitsClicksAndSticks.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0913_EXS_ElectronicDrumkitsClicksAndSticks.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0913_EXS_ElectronicDrumkitsClicksAndSticks"
end
