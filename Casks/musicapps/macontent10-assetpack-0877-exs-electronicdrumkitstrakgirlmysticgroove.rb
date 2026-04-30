cask "macontent10-assetpack-0877-exs-electronicdrumkitstrakgirlmysticgroove" do
  version "312eb79d0a1e5fd72b6159cec3f46969"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0877_EXS_ElectronicDrumkitsTrakgirlMysticGroove.pkg"
  name "MAContent10_AssetPack_0877_EXS_ElectronicDrumkitsTrakgirlMysticGroove"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0877_EXS_ElectronicDrumkitsTrakgirlMysticGroove.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0877_EXS_ElectronicDrumkitsTrakgirlMysticGroove.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0877_EXS_ElectronicDrumkitsTrakgirlMysticGroove"
end
