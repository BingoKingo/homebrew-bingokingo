cask "macontent10-assetpack-0822-exs-electronicdrumkitsplatinumdreams" do
  version "7eaf04a6ccf34accff90de45325fe5e5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0822_EXS_ElectronicDrumkitsPlatinumDreams.pkg"
  name "MAContent10_AssetPack_0822_EXS_ElectronicDrumkitsPlatinumDreams"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0822_EXS_ElectronicDrumkitsPlatinumDreams.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0822_EXS_ElectronicDrumkitsPlatinumDreams.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0822_EXS_ElectronicDrumkitsPlatinumDreams"
end
