cask "macontent10-assetpack-0834-exs-electronicdrumkitssupersolid" do
  version "2801f38cf89098454fa4b2b8dcbcc33d"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0834_EXS_ElectronicDrumkitsSuperSolid.pkg"
  name "MAContent10_AssetPack_0834_EXS_ElectronicDrumkitsSuperSolid"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0834_EXS_ElectronicDrumkitsSuperSolid.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0834_EXS_ElectronicDrumkitsSuperSolid.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0834_EXS_ElectronicDrumkitsSuperSolid"
end
