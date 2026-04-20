cask "macontent10-assetpack-0922-exs-electronicdrumkitsbattleblocks" do
  version "efd8940fc8efa8d8752a012cfb8ab4d1"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0922_EXS_ElectronicDrumkitsBattleBlocks.pkg"
  name "MAContent10_AssetPack_0922_EXS_ElectronicDrumkitsBattleBlocks"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0922_EXS_ElectronicDrumkitsBattleBlocks.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0922_EXS_ElectronicDrumkitsBattleBlocks.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0922_EXS_ElectronicDrumkitsBattleBlocks"
end
