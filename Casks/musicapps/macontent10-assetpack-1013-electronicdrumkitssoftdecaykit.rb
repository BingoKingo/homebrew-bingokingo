cask "macontent10-assetpack-1013-electronicdrumkitssoftdecaykit" do
  version "e49824ceca29b92029482aa64f860b48"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1013_ElectronicDrumKitsSoftDecayKit.pkg"
  name "MAContent10_AssetPack_1013_ElectronicDrumKitsSoftDecayKit"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1013_ElectronicDrumKitsSoftDecayKit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1013_ElectronicDrumKitsSoftDecayKit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1013_ElectronicDrumKitsSoftDecayKit"
end
