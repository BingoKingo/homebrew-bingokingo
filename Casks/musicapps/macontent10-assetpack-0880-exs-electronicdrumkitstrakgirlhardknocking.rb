cask "macontent10-assetpack-0880-exs-electronicdrumkitstrakgirlhardknocking" do
  version "4c03ee6a7c73426dd92f928b405f4967"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0880_EXS_ElectronicDrumkitsTrakgirlHardKnocking.pkg"
  name "MAContent10_AssetPack_0880_EXS_ElectronicDrumkitsTrakgirlHardKnocking"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0880_EXS_ElectronicDrumkitsTrakgirlHardKnocking.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0880_EXS_ElectronicDrumkitsTrakgirlHardKnocking.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0880_EXS_ElectronicDrumkitsTrakgirlHardKnocking"
end
