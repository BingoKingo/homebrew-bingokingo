cask "macontent10-assetpack-0776-exs-electronicdrumkitsvisionandverse" do
  version "f64312ca2b81f8f531d8c34d3257c486-9"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0776_EXS_ElectronicDrumkitsVisionAndVerse.pkg"
  name "MAContent10_AssetPack_0776_EXS_ElectronicDrumkitsVisionAndVerse"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0776_EXS_ElectronicDrumkitsVisionAndVerse.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0776_EXS_ElectronicDrumkitsVisionAndVerse.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0776_EXS_ElectronicDrumkitsVisionAndVerse"
end
