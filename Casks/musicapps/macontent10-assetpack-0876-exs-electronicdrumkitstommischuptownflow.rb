cask "macontent10-assetpack-0876-exs-electronicdrumkitstommischuptownflow" do
  version "2d75618eaaef70bb3ead5d9f244f0d36"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0876_EXS_ElectronicDrumkitsTomMischUptownFlow.pkg"
  name "MAContent10_AssetPack_0876_EXS_ElectronicDrumkitsTomMischUptownFlow"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0876_EXS_ElectronicDrumkitsTomMischUptownFlow.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0876_EXS_ElectronicDrumkitsTomMischUptownFlow.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0876_EXS_ElectronicDrumkitsTomMischUptownFlow"
end
