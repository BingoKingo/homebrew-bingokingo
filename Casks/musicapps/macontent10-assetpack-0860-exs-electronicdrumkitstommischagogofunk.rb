cask "macontent10-assetpack-0860-exs-electronicdrumkitstommischagogofunk" do
  version "f634448d346c1b08cf435967a0dd0e87"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0860_EXS_ElectronicDrumkitsTomMischAgogoFunk.pkg"
  name "MAContent10_AssetPack_0860_EXS_ElectronicDrumkitsTomMischAgogoFunk"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0860_EXS_ElectronicDrumkitsTomMischAgogoFunk.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0860_EXS_ElectronicDrumkitsTomMischAgogoFunk.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0860_EXS_ElectronicDrumkitsTomMischAgogoFunk"
end
