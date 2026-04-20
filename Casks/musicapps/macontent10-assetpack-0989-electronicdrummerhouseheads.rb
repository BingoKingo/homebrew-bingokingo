cask "macontent10-assetpack-0989-electronicdrummerhouseheads" do
  version "1b1b2aa802d9a08d1a6eefcb1dcae802"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0989_ElectronicDrummerHouseHeads.pkg"
  name "MAContent10_AssetPack_0989_ElectronicDrummerHouseHeads"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0989_ElectronicDrummerHouseHeads.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0989_ElectronicDrummerHouseHeads.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0989_ElectronicDrummerHouseHeads"
end
