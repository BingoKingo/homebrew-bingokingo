cask "macontent10-assetpack-0749-exs-electronicdrumkitsheavybasshouse" do
  version "32852967be26f0a8b4f6470b5ea9a87d"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0749_EXS_ElectronicDrumkitsHeavyBassHouse.pkg"
  name "MAContent10_AssetPack_0749_EXS_ElectronicDrumkitsHeavyBassHouse"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0749_EXS_ElectronicDrumkitsHeavyBassHouse.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0749_EXS_ElectronicDrumkitsHeavyBassHouse.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0749_EXS_ElectronicDrumkitsHeavyBassHouse"
end
