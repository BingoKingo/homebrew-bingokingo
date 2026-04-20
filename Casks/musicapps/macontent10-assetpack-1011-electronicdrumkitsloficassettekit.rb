cask "macontent10-assetpack-1011-electronicdrumkitsloficassettekit" do
  version "92aad81a47114d69f71c1819d9068995"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1011_ElectronicDrumKitsLoFiCassetteKit.pkg"
  name "MAContent10_AssetPack_1011_ElectronicDrumKitsLoFiCassetteKit"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1011_ElectronicDrumKitsLoFiCassetteKit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1011_ElectronicDrumKitsLoFiCassetteKit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1011_ElectronicDrumKitsLoFiCassetteKit"
end
