cask "macontent10-assetpack-0964-exs-electronicdrumkitshardwellradiumstrobe" do
  version "9ef3cc90ec68693846a9e89ad1439d4e"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0964_EXS_ElectronicDrumkitsHardwellRadiumStrobe.pkg"
  name "MAContent10_AssetPack_0964_EXS_ElectronicDrumkitsHardwellRadiumStrobe"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0964_EXS_ElectronicDrumkitsHardwellRadiumStrobe.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0964_EXS_ElectronicDrumkitsHardwellRadiumStrobe.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0964_EXS_ElectronicDrumkitsHardwellRadiumStrobe"
end
