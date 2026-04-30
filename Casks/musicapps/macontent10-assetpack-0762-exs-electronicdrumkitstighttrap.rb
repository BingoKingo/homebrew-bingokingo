cask "macontent10-assetpack-0762-exs-electronicdrumkitstighttrap" do
  version "76b1c799cc0a48b4cd387e7189d68491"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0762_EXS_ElectronicDrumkitsTightTrap.pkg"
  name "MAContent10_AssetPack_0762_EXS_ElectronicDrumkitsTightTrap"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0762_EXS_ElectronicDrumkitsTightTrap.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0762_EXS_ElectronicDrumkitsTightTrap.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0762_EXS_ElectronicDrumkitsTightTrap"
end
