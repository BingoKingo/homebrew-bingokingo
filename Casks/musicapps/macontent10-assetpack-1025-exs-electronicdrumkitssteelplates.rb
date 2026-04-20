cask "macontent10-assetpack-1025-exs-electronicdrumkitssteelplates" do
  version "0a5bfa96e91a5ef35c53bfdb7aba9080"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1025_EXS_ElectronicDrumkitsSteelPlates.pkg"
  name "MAContent10_AssetPack_1025_EXS_ElectronicDrumkitsSteelPlates"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1025_EXS_ElectronicDrumkitsSteelPlates.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1025_EXS_ElectronicDrumkitsSteelPlates.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1025_EXS_ElectronicDrumkitsSteelPlates"
end
