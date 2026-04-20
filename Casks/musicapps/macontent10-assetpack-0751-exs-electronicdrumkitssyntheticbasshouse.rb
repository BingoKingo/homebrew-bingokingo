cask "macontent10-assetpack-0751-exs-electronicdrumkitssyntheticbasshouse" do
  version "a789afc07b3c96e453633c564d578986"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0751_EXS_ElectronicDrumkitsSyntheticBassHouse.pkg"
  name "MAContent10_AssetPack_0751_EXS_ElectronicDrumkitsSyntheticBassHouse"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0751_EXS_ElectronicDrumkitsSyntheticBassHouse.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0751_EXS_ElectronicDrumkitsSyntheticBassHouse.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0751_EXS_ElectronicDrumkitsSyntheticBassHouse"
end
