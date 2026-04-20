cask "macontent10-assetpack-0994-electronicdrummertrapheat" do
  version "7cf43f650c03e0115e6ed3e3ff9888d2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0994_ElectronicDrummerTrapHeat.pkg"
  name "MAContent10_AssetPack_0994_ElectronicDrummerTrapHeat"
  desc "IsEssentialAddition"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0994_ElectronicDrummerTrapHeat.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0994_ElectronicDrummerTrapHeat.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0994_ElectronicDrummerTrapHeat"
end
