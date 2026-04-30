cask "macontent10-assetpack-0818-exs-electronicdrumkitsmetallicedges" do
  version "68034383fedbf790036b6db098b1d743"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0818_EXS_ElectronicDrumkitsMetallicEdges.pkg"
  name "MAContent10_AssetPack_0818_EXS_ElectronicDrumkitsMetallicEdges"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0818_EXS_ElectronicDrumkitsMetallicEdges.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0818_EXS_ElectronicDrumkitsMetallicEdges.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0818_EXS_ElectronicDrumkitsMetallicEdges"
end
