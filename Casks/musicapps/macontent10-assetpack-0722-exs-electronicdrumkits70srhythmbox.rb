cask "macontent10-assetpack-0722-exs-electronicdrumkits70srhythmbox" do
  version "c015cee46c15fe90f0bf2155bce07a99"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0722_EXS_ElectronicDrumkits70sRhythmBox.pkg"
  name "MAContent10_AssetPack_0722_EXS_ElectronicDrumkits70sRhythmBox"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0722_EXS_ElectronicDrumkits70sRhythmBox.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0722_EXS_ElectronicDrumkits70sRhythmBox.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0722_EXS_ElectronicDrumkits70sRhythmBox"
end
