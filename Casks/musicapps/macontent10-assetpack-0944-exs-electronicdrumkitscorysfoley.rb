cask "macontent10-assetpack-0944-exs-electronicdrumkitscorysfoley" do
  version "acf3e9fb3ad65a335101c9c41a2c82c0"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0944_EXS_ElectronicDrumkitsCorysFoley.pkg"
  name "MAContent10_AssetPack_0944_EXS_ElectronicDrumkitsCorysFoley"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0944_EXS_ElectronicDrumkitsCorysFoley.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0944_EXS_ElectronicDrumkitsCorysFoley.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0944_EXS_ElectronicDrumkitsCorysFoley"
end
