cask "macontent10-assetpack-0753-electronicdrumkitsprismatica" do
  version "cfc7dfe86ceaa43b3923a95bda117904"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0753_ElectronicDrumkitsPrismatica.pkg"
  name "MAContent10_AssetPack_0753_ElectronicDrumkitsPrismatica"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0753_ElectronicDrumkitsPrismatica.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0753_ElectronicDrumkitsPrismatica.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0753_ElectronicDrumkitsPrismatica"
end
