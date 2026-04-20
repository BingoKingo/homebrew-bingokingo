cask "macontent10-assetpack-0915-exs-electronicdrumkitspreciousgems" do
  version "21b7445ae804f5195e24300882ea185b"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0915_EXS_ElectronicDrumkitsPreciousGems.pkg"
  name "MAContent10_AssetPack_0915_EXS_ElectronicDrumkitsPreciousGems"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0915_EXS_ElectronicDrumkitsPreciousGems.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0915_EXS_ElectronicDrumkitsPreciousGems.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0915_EXS_ElectronicDrumkitsPreciousGems"
end
