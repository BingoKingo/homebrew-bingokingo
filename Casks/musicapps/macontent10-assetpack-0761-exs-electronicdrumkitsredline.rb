cask "macontent10-assetpack-0761-exs-electronicdrumkitsredline" do
  version "a3e82131190ce9bea18f3a6f801daa6f"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0761_EXS_ElectronicDrumkitsRedLine.pkg"
  name "MAContent10_AssetPack_0761_EXS_ElectronicDrumkitsRedLine"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0761_EXS_ElectronicDrumkitsRedLine.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0761_EXS_ElectronicDrumkitsRedLine.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0761_EXS_ElectronicDrumkitsRedLine"
end
