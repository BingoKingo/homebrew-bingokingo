cask "macontent10-assetpack-0904-exs-electronicdrumkitsmodulardrop" do
  version "423558636459a23df5bf5c8fa41c81d6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0904_EXS_ElectronicDrumkitsModularDrop.pkg"
  name "MAContent10_AssetPack_0904_EXS_ElectronicDrumkitsModularDrop"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0904_EXS_ElectronicDrumkitsModularDrop.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0904_EXS_ElectronicDrumkitsModularDrop.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0904_EXS_ElectronicDrumkitsModularDrop"
end
