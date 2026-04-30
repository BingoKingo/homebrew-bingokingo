cask "macontent10-assetpack-0811-exs-electronicdrumkitsdarkarts" do
  version "7208909711afa5a045ae103c606c94ea"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0811_EXS_ElectronicDrumkitsDarkArts.pkg"
  name "MAContent10_AssetPack_0811_EXS_ElectronicDrumkitsDarkArts"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0811_EXS_ElectronicDrumkitsDarkArts.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0811_EXS_ElectronicDrumkitsDarkArts.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0811_EXS_ElectronicDrumkitsDarkArts"
end
