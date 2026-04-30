cask "macontent10-assetpack-0810-exs-electronicdrumkitsabstractthought" do
  version "bf21ea375d60612fbaaa6ca45762a7d3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0810_EXS_ElectronicDrumkitsAbstractThought.pkg"
  name "MAContent10_AssetPack_0810_EXS_ElectronicDrumkitsAbstractThought"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0810_EXS_ElectronicDrumkitsAbstractThought.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0810_EXS_ElectronicDrumkitsAbstractThought.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0810_EXS_ElectronicDrumkitsAbstractThought"
end
