cask "macontent10-assetpack-1018-exs-electronicdrumkitsdancefloorbliss" do
  version "f1ed4a2e13e0aa6db6d4cd07e65ce213"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1018_EXS_ElectronicDrumkitsDancefloorBliss.pkg"
  name "MAContent10_AssetPack_1018_EXS_ElectronicDrumkitsDancefloorBliss"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1018_EXS_ElectronicDrumkitsDancefloorBliss.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1018_EXS_ElectronicDrumkitsDancefloorBliss.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1018_EXS_ElectronicDrumkitsDancefloorBliss"
end
