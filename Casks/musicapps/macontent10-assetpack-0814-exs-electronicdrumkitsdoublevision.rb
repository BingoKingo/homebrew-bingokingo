cask "macontent10-assetpack-0814-exs-electronicdrumkitsdoublevision" do
  version "d7d643015c83627debce500a6a8c656b"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0814_EXS_ElectronicDrumkitsDoubleVision.pkg"
  name "MAContent10_AssetPack_0814_EXS_ElectronicDrumkitsDoubleVision"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0814_EXS_ElectronicDrumkitsDoubleVision.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0814_EXS_ElectronicDrumkitsDoubleVision.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0814_EXS_ElectronicDrumkitsDoubleVision"
end
