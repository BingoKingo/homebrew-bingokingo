cask "macontent10-assetpack-1022-exs-electronicdrumkitsnewworld" do
  version "4bc4e732ac7cac7ceda5f210a30c285e"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1022_EXS_ElectronicDrumkitsNewWorld.pkg"
  name "MAContent10_AssetPack_1022_EXS_ElectronicDrumkitsNewWorld"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1022_EXS_ElectronicDrumkitsNewWorld.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1022_EXS_ElectronicDrumkitsNewWorld.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1022_EXS_ElectronicDrumkitsNewWorld"
end
