cask "macontent10-assetpack-0760-exs-electronicdrumkitsjaggededges" do
  version "31206b3c984cda5f4f69d32a5b76ec7a"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0760_EXS_ElectronicDrumkitsJaggedEdges.pkg"
  name "MAContent10_AssetPack_0760_EXS_ElectronicDrumkitsJaggedEdges"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0760_EXS_ElectronicDrumkitsJaggedEdges.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0760_EXS_ElectronicDrumkitsJaggedEdges.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0760_EXS_ElectronicDrumkitsJaggedEdges"
end
