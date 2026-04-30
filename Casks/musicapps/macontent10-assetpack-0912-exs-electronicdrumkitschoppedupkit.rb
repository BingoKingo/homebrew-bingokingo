cask "macontent10-assetpack-0912-exs-electronicdrumkitschoppedupkit" do
  version "8a54db88182eb487bb3b2d38ee562a74"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0912_EXS_ElectronicDrumkitsChoppedUpKit.pkg"
  name "MAContent10_AssetPack_0912_EXS_ElectronicDrumkitsChoppedUpKit"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0912_EXS_ElectronicDrumkitsChoppedUpKit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0912_EXS_ElectronicDrumkitsChoppedUpKit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0912_EXS_ElectronicDrumkitsChoppedUpKit"
end
