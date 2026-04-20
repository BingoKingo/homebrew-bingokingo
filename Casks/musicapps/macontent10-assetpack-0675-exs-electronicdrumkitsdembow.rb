cask "macontent10-assetpack-0675-exs-electronicdrumkitsdembow" do
  version "d261d158736eb890c5b52a32fdb3fdd3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0675_EXS_ElectronicDrumkitsDembow.pkg"
  name "MAContent10_AssetPack_0675_EXS_ElectronicDrumkitsDembow"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0675_EXS_ElectronicDrumkitsDembow.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0675_EXS_ElectronicDrumkitsDembow.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0675_EXS_ElectronicDrumkitsDembow"
end
