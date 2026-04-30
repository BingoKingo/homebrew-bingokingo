cask "macontent10-assetpack-0843-exs-electronicdrumkitsboysnoizebigbang" do
  version "0cfe2886b7c08e1092305da3eff3126f"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0843_EXS_ElectronicDrumkitsBoysNoizeBigBang.pkg"
  name "MAContent10_AssetPack_0843_EXS_ElectronicDrumkitsBoysNoizeBigBang"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0843_EXS_ElectronicDrumkitsBoysNoizeBigBang.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0843_EXS_ElectronicDrumkitsBoysNoizeBigBang.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0843_EXS_ElectronicDrumkitsBoysNoizeBigBang"
end
