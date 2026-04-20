cask "macontent10-assetpack-0678-exs-electronicdrumkitsfuturebreaks" do
  version "45c63ed7c9c330a0b6e7a6fa199f2ef9"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0678_EXS_ElectronicDrumkitsFutureBreaks.pkg"
  name "MAContent10_AssetPack_0678_EXS_ElectronicDrumkitsFutureBreaks"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0678_EXS_ElectronicDrumkitsFutureBreaks.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0678_EXS_ElectronicDrumkitsFutureBreaks.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0678_EXS_ElectronicDrumkitsFutureBreaks"
end
