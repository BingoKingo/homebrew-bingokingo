cask "macontent10-assetpack-0680-exs-electronicdrumkitsinfinity" do
  version "db3fd9438e14e4a7bfaaebca3b4f7ea6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0680_EXS_ElectronicDrumkitsInfinity.pkg"
  name "MAContent10_AssetPack_0680_EXS_ElectronicDrumkitsInfinity"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0680_EXS_ElectronicDrumkitsInfinity.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0680_EXS_ElectronicDrumkitsInfinity.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0680_EXS_ElectronicDrumkitsInfinity"
end
